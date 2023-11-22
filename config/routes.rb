Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  resources :cameras do
    member do
      # Availability must have camera_id as a param
      # Availability only has new, create and destroy
      resources :availabilities, only: [:new, :create, :destroy]
      resources :bookings, only: [:new, :create]
    end
  end
end
