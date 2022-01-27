# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :users
  resources :products do
    get :who_bought, on: :member
    resources :reviews
  end
  resources :support_requests, only: %i[index update]
  scope '(:locale)', defaults: { locale: 'en' } do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
end
