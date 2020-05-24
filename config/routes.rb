Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'
  resources :users, only: [:index, :show, :edit, :update, :new]
  resources :items do
    resources :comments, only: :create
    resources :item_images, only: [:new, :edit, :update, :create]
    resources :brands, only: [:new, :edit, :update, :create]
    resources :shipping, only: [:new, :edit, :update, :create]
  end
  resources :item_payment
  resources :credit_cards, only: [:new, :create, :edit] do
  end
end
