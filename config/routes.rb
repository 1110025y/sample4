Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    collection do
      get 'category'
    end
  end
  resources :users
end
