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

  #post 'purchase_orders/connect' => 'purchase_orders#connect', as: :purchase_order_connect
  get 'purchase_orders/:id/select' => 'purchase_orders#select', as: :select_purchase_order
  resources :purchase_orders

  get 'vendors/:id/select' => 'vendors#select', as: :select_vendor
  resources :vendors

  #post 'trailers/connect_po' => 'trailers#connect_po', as: :trailer_connect_po
  #get 'trailers/:id/select' => 'trailers#select', as: :select_trailer
  resources :trailers

  resources :user_access_levels

  root 'm2w#index'
  get '*path' => redirect('/')







end
