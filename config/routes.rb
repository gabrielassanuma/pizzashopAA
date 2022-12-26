Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  get 'carts/:id', to: "carts#show", as: "cart"
  delete 'carts/:id', to: "carts#destroy"
  post 'order_products/:id/add', to: "order_products#add_quantity", as: "order_product_add"
  post 'order_products/:id/reduce', to: "order_products#reduce_quantity", as: "order_product_reduce"
  post 'order_products', to: "order_products#create"
  get 'order_products/:id', to: "order_products#show", as: "order_product"
  delete 'order_products/:id', to: "order_products#destroy"
  resources :products
  resources :orders
end
