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
  resources :likes
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

  get '/tripsearch', to:"trips#search"
  get 'likesupdate', to:"likes#update"
  post "/create_location", to: "trips#create_location"
  get '/search_user', to: 'users#search'

  get 'followuser', to: 'star_fans#follow'
  get 'follows', to: 'star_fans#follows'

  # Add Locations to Trip from Search or new Location
  get "/triplocation_instances", to: "trip_locations#triplocation_instances"
  get "/search", to: "locations#search"
  post "/create_location", to: "trips#create_location"
  post "/add_search_location", to: "trips#add_search_location"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
