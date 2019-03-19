Rails.application.routes.draw do
  devise_for :users

  constraints CourierRouteConstraint.new do
    root to: "pages#courier_home"
  end

  constraints AuthorizerRouteConstraint.new do
    root to: "pages#authorizer_dashboard"
  end

  constraints SupervisorRouteConstraint.new do
    root to: "pages#supervisor_dashboard"
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :applications

  delete "attachments/:id", to: "applications#delete_image_attachment"

  delete "applications/attachments/:id", to: "applications#delete_attachment_collection"

  mount ActionCable.server => "/cable"
end
