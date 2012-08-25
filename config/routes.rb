Tribally::Application.routes.draw do
 
ActiveAdmin.routes(self)

devise_for :admin_users, ActiveAdmin::Devise.config

resources :products do
	collection do 
		post "add_comment"
    post "create_offer"
    get "solar"
<<<<<<< HEAD
    get "solar_offers"
=======
    post "product_group"
>>>>>>> c730e2a5bbf46eca4c2c32838c9cc8e35354b35e
	end
end

resources :businesses do
  collection do
    get "business_signup"
  end
end

  
resources :tribes do
    collection do
      get "change_invitation_status"
      get "my_tribe"
      get "tribe_products"
      get "i_want_this"
      post "invite_friend"
      get "solar"
     end
end
 


  root :to => "tribes#index"
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_scope :user do
  #  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  #end
  resources :users, :only => [:show, :index]
end

