Rails.application.routes.draw do
  get 'ddrivers/index'
  get 'ddrivers/show'
  get 'ddrivers/update'
  get 'ddrivers/new'
  devise_for :users
  root 'pages#home'
  get 'pizzas', to: "pages#pizzas", as: "pizzas"
  get 'drinks', to: "pages#drinks", as: "drinks"
  get 'desserts', to: "pages#desserts", as: "desserts"
  get 'front_store', to: "pages#front_store", as: "front_store"
  get 'kitchen', to: "pages#kitchen", as: "kitchen"
  get 'carts/:id', to: "carts#show", as: "cart"
  delete 'carts/:id', to: "carts#destroy"
  post 'order_products/:id/add', to: "order_products#add_quantity", as: "order_product_add"
  post 'order_products/:id/reduce', to: "order_products#reduce_quantity", as: "order_product_reduce"
  post 'order_products', to: "order_products#create"
  get 'order_products/:id', to: "order_products#show", as: "order_product"
  delete 'order_products/:id', to: "order_products#destroy"
  resources :products
  resources :orders
  resources :ddrivers
  get 'track', to: "pages#track", as: "track"
end
