Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/index'
  devise_for :users
  resources :order_items
  get 'cart', to: 'cart#show'
  resources :products
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
