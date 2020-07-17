Rails.application.routes.draw do
  resources :users do 
    resources :recipe
  end 
  resources :ingredients

  get '/', to: 'users#index'
  get '/signup', to: 'users#signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'users#destroy'
  post '/recipes', to: 'recipe#create'
  post '/ingredients', to: 'ingredients#create'
  get '/recipe/created', to: 'recipe#created'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
