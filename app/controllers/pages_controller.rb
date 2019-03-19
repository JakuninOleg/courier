class PagesController < ApplicationController
  before_action :authenticate_user!

  def courier_home
    @applications = Application.where("user_id = ? AND status_id between ? and ?", current_user.id, 2, 12)
  end

  def authorizer_dashboard
    @applications = Application.all
    respond_to do |format|
      format.html
      format.js { render action: "edit.js.erb" }
    end
  end

  def supervisor_dashboard
    @applications = Application.all
    @application = Application.new
    respond_to do |format|
      format.html
      format.js { render action: "edit.js.erb" }
    end
  end
end
