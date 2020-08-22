Rails.application.routes.draw do

  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :topics
  
  
  get 'favorites/index' 
  post '/favorites' , to: 'favorites#create' 
  delete '/favorites', to: 'favorites#destroy'
  
  get 'comments/index'
  get 'comments/new'
  post '/comments', to: 'comments#create'
end
