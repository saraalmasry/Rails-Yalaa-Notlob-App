Rails.application.routes.draw do


  get 'groups/index'
  get 'friend_ship/Friends'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
  get 'orders_list' => "orders#list"
  get "orders/new" => "orders#new"
end
