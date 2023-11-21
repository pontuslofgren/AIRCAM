Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cameras do
    member do
      # Availability must have camera_id as a param
      # Availability only has new, create and destroy
      resources :availabilities, only: [:new, :create, :destroy]
    end
  end
end
