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
  get '/recipes', to: 'recipe#new'
  post '/recipes', to: 'recipe#create'
  get "/recipes/:id", to: 'recipe#show'
  patch "/recipe", to: 'recipe#update'
  get '/local', to: 'ingredients#local'
  get '/user/:user_id/recipe/:id/delete', to: 'recipe#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
