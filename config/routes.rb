Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated do
    root to: "categories#index", as: :authenticated_user
  end

  root to: "splash#index", as: :unauthenticated_user

  resources :categories, only: [:index, :show, :new, :create] do
    resources :transactions, only: [:index]
  end
  resources :transactions, only: [:new, :create]
end
