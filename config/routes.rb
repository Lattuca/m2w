Rails.application.routes.draw do
  resources :carriers
  resources :rail_cars
  post 'purchase_orders/connect' => 'purchase_orders#connect', as: :purchase_order_connect
  resources :purchase_orders
  get 'vendors/select' => 'vendors#select', as: :select_vendor
  resources :vendors
  resources :trailers
  resources :user_access_levels
  resources :users




  get 'm2w' => 'm2w#index', as: :m2w


end
