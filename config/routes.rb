Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  resources :collaborators, only: [:create, :update, :destroy]
  resources :projects, only: [:create, :update, :destroy]
  resources :users, only: [:create]

  post '/signup', to: 'users#create'
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
