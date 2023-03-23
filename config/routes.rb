Rails.application.routes.draw do
  resources :posts
  namespace :admin do
    resources :users, only: [:update, :edit, :destroy]

    root "admin#index"
  end

  # sessions stuff
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  root to: "posts#index"
end
