Rails.application.routes.draw do
  resources :ingredients
  resources :remixes
  resources :recipes
  resources :users
  resources :users, only: [:show] do 
    resources :recipes, only: [:index]
    resources :remixes, only: [:index]
  end 


  get '/', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/logout', to: 'users#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
