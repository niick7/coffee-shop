# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'items#index'
  resources :items, only: [:index] do
    member do
      get 'add_item_to_cart'
    end
  end
  resources :carts, only: [:index] do
    collection do
      get 'clear_cart'
      post 'checkout'
    end
  end
end
