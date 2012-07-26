Tribally::Application.routes.draw do
  resources :businesses

  resources :products

  resources :tribes do
    collection do
      get "change_invitation_status"
      get "my_tribe"
    end
  end

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_scope :user do
  #  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  #end
  resources :users, :only => [:show, :index]
end

