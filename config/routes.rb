Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  
  root to: 'items#index'
  resources :items do
    member do
      get 'purchase'
      post 'pay'
      get 'done'
    end
  end
  resources :users, only: :show
  resources :logouts, only: :index

  resources :cards, only: [:new, :show] do
    collection do
      post 'show'
      post 'pay'
      post 'delete'
    end
  end

  resources :purchase, only: :show do # 商品購入確認ページ
    collection do
      post 'pay'
      get 'done'
    end
  end

end
