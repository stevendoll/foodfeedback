Rails.application.routes.draw do


  resources :accounts

  namespace :practice do
  get 'dashboard/index'
  end

  get '/auth/fatsecret/callback', to: 'api_tokens#create'


  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, :controllers => { :invitations => 'invitations', :confirmations => 'confirmations' }
  #devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, :controllers => { :confirmations => 'confirmations' }
  resources :users

  namespace :practice do
    devise_for :users, :path => '', :path_names => { :sign_up => "register" }, :controllers => { :registrations => 'practice/registrations', :confirmations => 'confirmations' }, :skip => [:sessions, :passwords, :confirmations, :invitations]
  end


  get 'dashboard' => 'dashboard#index'

  root to: 'visitors#index'

  resources :users do
    get 'invite', :on => :member
  end

end
