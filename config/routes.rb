Rails.application.routes.draw do


  get '/auth/fatsecret/callback', to: 'api_tokens#create'


  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  resources :users

  namespace :practice do
    devise_for :users, :path => '', :path_names => { :sign_up => "register" }, :controllers => { :registrations => 'practice/registrations' }, :skip => [:sessions, :passwords, :confirmations, :invitations]
  end


  get 'dashboard' => 'dashboard#index'

  root to: 'visitors#index'

  resources :users do
    get 'invite', :on => :member
  end

end
