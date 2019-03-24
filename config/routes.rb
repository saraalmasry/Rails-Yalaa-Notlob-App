Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks", confirmations: "confirmations"}
  notify_to :users, with_devise: :users, devise_default_routes: true

  get '/users/sign_up'
  root :to => redirect('/users/sign_in')

  # get 'orders', to: 'orders#index'
  # get 'orders/:id', to: 'orders#show' do
  resources :orders do
    resources :user_orders

  end

  get 'myfriends_data',  to: 'orders#friends_data'


  # get "/auth/facebook/callback" => "users/omniauth_callbacks#facebook"
  # get "/auth/google_oauth2/callback" => "users/omniauth_callbacks#google_oauth2"

  get 'groups/index'
  resources :groups

  resources :friend_ship , only: [:index, :create]
  # get 'friend_ship/Friends'

  # post 'friend_ship/Friends' => 'friend_ship#addFriend'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
  get 'orders_list' => "orders#list"
  get "orders/new" => "orders#new"

  get 'orders/add' => 'orders#add'
end
