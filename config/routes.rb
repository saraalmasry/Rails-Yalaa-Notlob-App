Rails.application.routes.draw do
  get 'orders/list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "orders/add" => "orders#add"
end
