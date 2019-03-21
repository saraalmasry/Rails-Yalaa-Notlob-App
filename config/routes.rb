Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  get '/users/sign_up'
  root :to => redirect('/users/sign_in')

  # get 'orders', to: 'orders#index'
  # get 'orders/:id', to: 'orders#show' do
  resources :orders do
    resources :user_orders
  end

  get 'orders/list'

  get 'groups/index'
  resources :groups
  get 'friend_ship/Friends'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'orders/add' => 'orders#add'
end
