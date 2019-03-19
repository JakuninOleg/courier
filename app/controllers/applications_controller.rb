class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_application, only: %i[edit show update destroy delete_attachment_collection]

  def index
    @applications = Application.all
  end

  def show
    @statuses = Status.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user ? email = @application.user.email : email = ""
    if @application.save
      ActionCable.server.broadcast "applications",
        phone: @application.phone,
        address: @application.address,
        region: @application.region.name,
        status_id: @application.status_id,
        status_courier: @application.status.courier,
        status_authorizer: @application.status.authorizer,
        status_supervisor: @application.status.supervisor,
        sputnikid: @application.sputnikid,
        name: @application.name,
        time: @application.time.strftime("%d.%m.%Y"),
        timeslot: @application.timeslot.range,
        id: @application.id,
        courier: email,
        courier_id: @application.user_id,
        color: helpers.label_color(@application.status.id),
        create: true
      head :ok
    end
  end

  def destroy
    @application.destroy
    ActionCable.server.broadcast "applications",
      id: @application.id,
      status_id: @application.status_id,
      delete: true
    head :ok
  end

  def edit
    respond_to do |format|
      format.js { render action: "edit.js.erb" }
    end
  end

  def update
    @application.update(application_params)
    stream_application
  end

  def delete_image_attachment
    @application_image = ActiveStorage::Attachment.find(params[:id])
    @application_image.purge_later

    respond_to do |format|
      format.js { render action: "delete_photo.js.erb", :locals => {:id => params[:id]} }
    end
  end

  def delete_attachment_collection
    ActiveStorage::Attachment.where(name: "agreement_photos", record_id: params[:id]).each do |attachment|
      attachment.purge_later
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def find_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:name, :address, :phone, :region, :status_id, :card,
                                        :time, :timeslot_id, :sputnikid, :user_id, :region_id,
                                        :passport_photo, :registration, :client_passport,
                                        :loan_agreement, :asp_agreement, :third_party_agreement,
                                        :pd_agreement, agreement_photos: [])
  end

  def stream_application
    ActionCable.server.broadcast "applications",
                                 phone: @application.phone,
                                 card: @application.card,
                                 region: @application.region.name,
                                 email: @application.user.email,
                                 address: @application.address,
                                 status_courier: @application.status.courier,
                                 status_authorizer: @application.status.authorizer,
                                 status_supervisor: @application.status.supervisor,
                                 status_id: @application.status_id,
                                 sputnikid: @application.sputnikid,
                                 name: @application.name,
                                 time: @application.time.strftime("%d.%m.%Y"),
                                 timeslot: @application.timeslot.range,
                                 id: @application.id,
                                 courier_id: @application.user_id,
                                 color: helpers.label_color(@application.status_id),
                                 update: true,
                                 role: current_user.role_id,
                                 user_id: current_user.id
    head :ok
  end
end
