Rails.application.routes.draw do
  # get "users#index"
  root "trips#index"
  resources :users
  resources :locations
  resources :trip_locations
  resources :trips
  resources :trip_users
  resources :star_fans
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
