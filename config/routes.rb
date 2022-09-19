Rails.application.routes.draw do
  resources :categories
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/index'
  devise_for :users
  resources :order_items
  get 'cart', to: 'cart#show'
  post 'cart/complete-order', to: 'cart#complete_order'

  get 'checkout', to: 'cart#checkout'
  resources :products
  resources :orders
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
