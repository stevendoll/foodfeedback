Rails.application.routes.draw do
  root to: 'visitors#index'

  get '/auth/fatsecret/callback', to: 'api_tokens#create'
  get '/auth/fatsecret'


  devise_for :users
  resources :users
end
