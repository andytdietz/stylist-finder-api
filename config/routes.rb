Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:index, :create]
  resources :stylists, only: [:index, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
