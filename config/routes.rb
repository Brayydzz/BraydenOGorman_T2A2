Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: 'pages#home'
  resources :equipment_listings
  resources :services
  resources :conversations do
    resources :messages
  end
  resources :users, only: :index
  resources :item_types, only: :index do
    resources :equipment_listings, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
