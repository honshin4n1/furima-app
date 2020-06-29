Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root to: 'items#index'
  resources :items, only: [:index, :new ,:create, :show]do
    member do
      get 'purchase'
    end
  end
  resources :users, only: :show
  resources :logouts, only: :index
  resources :cards, only: [:new, :create]
end
