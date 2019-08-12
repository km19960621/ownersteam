Rails.application.routes.draw do
  root 'orders#index'

  get 'sessions/new'

  resources :users
  get 'users/:id/cards', to: 'users#cards'
  resources :cards
  resources :positions
  resources :orders

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
