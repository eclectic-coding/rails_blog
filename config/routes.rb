Rails.application.routes.draw do
  resources :posts
  namespace :admin do
    root "admin#index"
  end


  # user account stuff
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  # sessions stuff
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  root to: "posts#index"
end
