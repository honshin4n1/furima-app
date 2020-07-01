Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root to: 'items#index'
  resources :items, only: [:index, :new ,:create, :show]do
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
