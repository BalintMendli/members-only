Rails.application.routes.draw do
  root 'posts#index'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#delete'
  resources :posts, only: [:new, :create, :index]
  resources :users, only: [:new, :create]
end
