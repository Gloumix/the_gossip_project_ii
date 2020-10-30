Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/welcome/:id', to:'welcome#show'
  get '/contact', to:'contact#show'
  get '/team', to:'team#show'
  get '/profile', to:'profile#show'
  resources :gossip
  resources :user
  resources :city
  resources :commentary
  resources :sessions, only: [:new, :create, :destroy]
end
