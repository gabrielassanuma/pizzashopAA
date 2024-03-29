Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'take_away', to: "pages#take_away", as: "take_away"
  get 'my_orders', to: "pages#my_orders", as: "my_orders"
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
  resources :delivery_fees , only: [:index, :edit, :update]
  resources :products, except: [:destroy] do
    patch :deactive, on: :member
  end
  resources :orders, only: [:index, :create, :new, :show, :update] do
    post 'repeat', on: :member, as: :repeat
    patch :accept, on: :member
    patch :ready, on: :member
    patch :finalize, on: :member
    get 'track', on: :member, as: :track
  end
  resources :ddrivers, except: [:destroy] do
    patch :deactive , on: :member
  end
end
