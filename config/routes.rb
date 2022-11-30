Rails.application.routes.draw do
  # get "users#index"
  root "trips#index" #view all trips in db

  resources :users do
    member do  
      get :trips
    end
  end
  resources :locations
  resources :trip_locations
  resources :trips do
    member do  
      get :branches
      get :locations
    end
    member do
      get :new_child
    end
  end
  resources :trip_users
  resources :star_fans
  resources :articles

  get "/signup", to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  get '/search_user', to: 'users#search'

  post "/create_location", to: "trips#create_location"
  get "/search", to: "locations#search"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
