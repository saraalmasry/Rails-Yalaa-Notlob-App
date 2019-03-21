Rails.application.routes.draw do

  # resources :orders

  get 'orders/list'
  get 'orders/index'

  get 'groups/index'
  get 'friend_ship/Friends'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "orders/add" => "orders#add"
end
