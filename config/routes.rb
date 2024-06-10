Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: [:edit, :update]
  resources :prototypes, only: [:index, :new, :create]
end

