Rails.application.routes.draw do
  root 'welcome#index'

  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :users, only: [:create]
end
