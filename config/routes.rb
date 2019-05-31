Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#delete'
  resources :posts, only: [:new, :create, :index]
end
