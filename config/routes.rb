Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "profile", to: "pages#profile"

  resources :cameras do
    member do
      resources :availabilities, only: [:new, :create, :destroy]
      resources :bookings, only: [:new, :create]
    end
  end

  resources :bookings, only: [:index, :show, :destroy], as: 'my_bookings'
  get "/bookings/:id/confirm", to: "bookings#confirm", as: "confirm_booking"
  resources :searches, only: [:new]
end