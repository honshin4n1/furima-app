Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new ,:create] do
    member do
      get 'purchase'
    end
  end
  resources :users, only: :show
  resources :logouts, only: :index
  resources :cards, only: [:new, :create]
end
