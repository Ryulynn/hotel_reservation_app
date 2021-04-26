Rails.application.routes.draw do
  #home
  get '/', to: 'home#top'
  
  #user
  get 'user/signup', to: 'user#new'
  post 'user/create', to: 'user#create'
  get 'user/login', to: 'user#login_form'
  post 'user/login', to: 'user#login'
  post 'user/logout', to: 'user#logout'
  get 'user/:id', to: 'user#show'
  post 'user/:id', to: 'user#update'
  
  #rooms
  get 'rooms/index', to: 'rooms#index'
  resources :rooms
  
  #reservations
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
