Rails.application.routes.draw do

  get '/auth/fatsecret/callback', to: 'api_tokens#create'


  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users

  # authenticated :user do
  #   root :to => 'dashboard#index', id: 'home', as: :dashboard
  # end

  get 'dashboard', to: 'dashboard#index'

  root to: 'visitors#index'

end
