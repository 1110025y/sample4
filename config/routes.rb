Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :comments, only: :create
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category'
    end
  end
  resources :users do
    member do
      get 'exhibitedShow'
    end
    collection do
      get 'setUpShow'
    end
  end

  resources :addresses, only: [:new, :create, :edit, :update]
  resources :credit_cards, only: [:new, :create, :destroy, :show]
end
