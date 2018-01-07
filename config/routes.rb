Rails.application.routes.draw do
  root 'welcome#index'

  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'
  get '/profile', to: 'users#show', as: 'profile'
  get '/profile/edit', to: 'users#edit', as: 'edit_profile'
  resources :users, only: [:create, :update]
end
