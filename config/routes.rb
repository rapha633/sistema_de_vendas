Rails.application.routes.draw do
  resources :clientes, only: [:new, :create, :index, :show]
  resources :produtos, only: [:new, :create, :index, :show]
  resources :vendas, only: [:new, :create, :index, :show, :destroy]
  root to: 'home#index'
end
