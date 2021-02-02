Rails.application.routes.draw do
  resources :users, only: [:create]
  post "/login",to: "users#login"

  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'

  # namespace :api do
  #   namespace :v1 do
  #   resources :users, only: [:create] do
  #       post "/login",to: "users#login"
  #       # post "/create",to: "users#create"
    
  #     end
  #   end
  # end
end
