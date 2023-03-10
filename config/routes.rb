Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "dinners/locations", to: "dinners#locations"
  get "dinners/search", to: "dinners#search"
  resources :dinners, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
