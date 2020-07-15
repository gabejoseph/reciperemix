Rails.application.routes.draw do
  resources :users
  resources :recipe do 
    resources :ingredients
  end 
  resources :remixes do 
    resources :ingredients
  end 


  get '/', to: 'users#index'
  get '/signup', to: 'users#signup'
  get '/login', to: 'users#login'
  get '/logout', to: 'users#destroy'
  get '/recipe/created', to: 'recipe#created'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
