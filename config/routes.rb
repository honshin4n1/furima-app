Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end

  root to: 'items#index'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
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

end
