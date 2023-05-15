Rails.application.routes.draw do
  # https protocols
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # creating a session
  post '/login', to: 'sessions#create'
  # current session
  get '/session', to: 'sessions#show'
  # destroy a session
  delete '/logout', to: 'sessions#destroy'


  post '/users', to: 'users#create'
  
  delete '/logout', to: 'sessions#destroy'

end
