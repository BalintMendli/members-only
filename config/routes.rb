Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new', as: 'sign_in'
end
