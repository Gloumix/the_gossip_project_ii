Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :welcome, only: [:show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :profile, only: [:index]
  resources :gossip
  resources :user
  resources :city
  resources :commentary
  resources :sessions, only: [:new, :create, :destroy]
end
