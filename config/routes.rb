Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]

    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'list'
      get 'search'
      get 'detail_search'
    end
    member do
      get 'purchase'
      post 'pay'
    end
  end

  resources :users do
    member do #idを指定して特定のページにいく必要がある
      get 'exhibitedShow'
      get 'purchaseGoods'
      get 'commentGoods'
      get 'favoriteGoods'
    end
    collection do #idを指定して特定のページにいく必要がない
      get 'setUpShow'
      get 'information'
    end
  end

  resources :addresses, only: [:new, :create, :edit, :update]
  resources :credit_cards, only:[:index, :new, :create, :destroy, :show]
end
