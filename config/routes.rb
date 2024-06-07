Rails.application.routes.draw do
  root to: 'prototypes#index'
  resources :prototype, only: :index
end
