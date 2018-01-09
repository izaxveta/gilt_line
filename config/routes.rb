Rails.application.routes.draw do
  root 'welcome#index'


  get 'admin/dashboard', to: 'admin/dashboard#index'
  get '/dashboard',      to: 'dashboard#index'
  get '/login',          to: 'sessions#new'
  post '/login',         to: 'sessions#create'
  delete '/login',       to: 'sessions#destroy', as: 'logout'
  get 'admin/settings',  to: 'admin/dashboard#show', as: 'settings'

  get '/admin/fashion-brands', to: 'admin/fashion_brands#index', as: 'fashion_brands'
  get '/admin/fashion-brands/new', to: 'admin/fashion_brands#new', as: 'new_fashion_brand'
  post '/admin/fashion-brands', to: 'admin/fashion_brands#create'

  get '/profile',        to: 'users#show',       as: 'profile'
  get '/profile/edit',   to: 'users#edit',       as: 'edit_profile'

  resources :users, only: [:create, :update]
  resources :search, only: [:index]
end
