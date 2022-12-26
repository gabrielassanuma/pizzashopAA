Rails.application.routes.draw do
  get 'products/index'
  get 'products/new'
  get 'products/edit'
  get 'carts/show'
  devise_for :users, sign_out_via: [:delete, :get]
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
