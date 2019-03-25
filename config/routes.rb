Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks", confirmations: "confirmations"}

  resources :notifications

  get '/users/sign_up'
  root 'home#homepage'

  get 'orders_list' => "orders#list"

  resources :orders do
    resources :user_orders
  end

  get 'myfriends_data',  to: 'orders#friends_data'


  # get "/auth/facebook/callback" => "users/omniauth_callbacks#facebook"
  # get "/auth/google_oauth2/callback" => "users/omniauth_callbacks#google_oauth2"

  get 'groups/index'
  resources :groups  
  resources :groups_user
  

  resources :friend_ship , only: [:index, :create, :destroy]
  # get 'friend_ship/Friends'

  # post 'friend_ship/Friends' => 'friend_ship#addFriend'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
