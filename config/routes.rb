Rails.application.routes.draw do
  get 'transactions/index'
  get 'transactions/new'
  get 'transactions/create'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated do
    root to: "categories#index", as: :authenticated_user
  end

  root to: "splash#index", as: :unauthenticated_user

  resources :categories, only: [:index, :show, :new, :create] do
    resources :transactions, only: [:index, :new, :create]
  end
end
