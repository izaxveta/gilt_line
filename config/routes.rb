Rails.application.routes.draw do
  root 'welcome#index'

  get '/venue', to: 'venues#show', as: 'venue'

  get '/login',          to: 'sessions#new'
  post '/login',         to: 'sessions#create'
  delete '/login',       to: 'sessions#destroy', as: 'logout'

  get 'admin/dashboard', to: 'admin/dashboard#index'
  get 'admin/settings',  to: 'admin/dashboard#show', as: 'settings'

  get '/admin/labels',     to: 'admin/labels#index', as: 'labels'
  get '/admin/labels/new', to: 'admin/labels#new',   as: 'new_label'
  post '/admin/labels',    to: 'admin/labels#create'
  patch '/admin/',    to: 'admin/labels#create'

  get '/admin/venue-categories',           to: 'admin/venue_categories#index', as: 'venue_categories'
  get '/admin/venue-categories/generator', to: 'admin/venue_categories#new',   as: 'venue_category_generator'
  get '/admin/venue-categories/:id',       to: 'admin/venue_categories#show',  as: 'venue_category'
  post '/admin/venue-categories',          to: 'admin/venue_categories#create'
  get '/admin/venue-categories/:id/edit',       to: 'admin/venue_categories#edit', as: 'edit_venue_category'
  patch '/admin/venue-categories/:id',       to: 'admin/venue_categories#update'

  get '/dashboard',      to: 'dashboard#index'

  get '/profile',        to: 'users#show',       as: 'profile'
  get '/profile/edit',   to: 'users#edit',       as: 'edit_profile'

  get '/search', to: 'search#index', as: 'search_index'
  resources :users, only: [:create, :update]
end
