Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  
  root to: 'items#index'
  resources :items, only: [:index, :new ,:create, :show] do
    member do
      get 'purchase'
    end
  end
  resources :users, only: :show
  resources :logouts, only: :index
  resources :cards, only: [:new, :create]
end
