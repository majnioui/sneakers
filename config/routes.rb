Rails.application.routes.draw do
  root 'pages#home'
  resources :categories

  
  devise_for :users
  resources :order_items
  get 'cart', to: 'cart#show'
  post 'cart/complete-order', to: 'cart#complete_order'

  get 'checkout', to: 'cart#checkout'
  resources :products do
    resources :reviews
  end
  resources :orders


  get 'my-profile', to: 'users#my'
  get 'my-profile/orders', to: 'orders#index'
  get 'my-profile/orders/:id', to: 'orders#show', as: "my_order"

  
  get 'admin', to: 'admin#index'
  get 'admin/orders', to: 'admin#orders'
  get 'admin/orders/:order_id', to: 'admin#order', as: "admin_order"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
