Rails.application.routes.draw do
  resources :collaborators, only: [:create, :destroy]
  resources :projects, only: [:create, :update, :destroy]
  resources :users, only: [:create]

  post '/signup', to: 'users#create'
  post '/login', to: 'auth#create'
  get '/projects', to: 'users#projects'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
