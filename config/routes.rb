Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated do
    root to: "categories#index", as: :authenticated_user
  end

  root to: "splash#index", as: :unauthenticated_user
end
