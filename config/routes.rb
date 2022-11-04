Rails.application.routes.draw do
  # get "users#index"
  root "trips#index" #view all trips in db

  resources :users
  resources :locations
  resources :trip_locations
  resources :trips do
    member do  
      get :branches
    end
  end
  resources :trip_users
  resources :star_fans
  resources :articles

  get '/signup', to: 'users#new'
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
