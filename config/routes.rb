Rails.application.routes.draw do

  get 'm2w' => 'm2w#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :users

  resources :carriers
  resources :rail_cars
  post 'purchase_orders/connect' => 'purchase_orders#connect', as: :purchase_order_connect
  resources :purchase_orders
  get 'vendors/:id/select' => 'vendors#select', as: :select_vendor
  resources :vendors
  resources :trailers
  resources :user_access_levels

  root 'm2w#index'
  get '*path' => redirect('/')







end
