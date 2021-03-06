Rails.application.routes.draw do
  resources :users 
  resources :recipe
  resources :ingredients

  root 'users#index'
  get '/signup', to: 'users#signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'users#destroy'
  get '/lowcal', to: 'ingredients#lowcal'
  

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# match '/app/github/callback', to: 'sessions#create', via: [:get, :post]
# root 'welcome#home'
