Rails.application.routes.draw do
  get "inventories/index"
  get "home/index"
  root 'home#index'
  resources :inventories, only: [:index]
  resources :transactions, only: [:index, :new, :create]

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
