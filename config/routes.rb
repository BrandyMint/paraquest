Rails.application.routes.draw do
  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :user_sessions, only: %i[new create destroy]

  get 'signup' => 'users#new', as: :signup

  resource :profile, only: %i[show edit update]
  resources :users, only: %i[create] do
    member do
      get :activate
    end
  end

  resources :password_resets, only: %i[new create edit update]

  root to: 'dashboard#index'

  namespace :admin do
    resources :users
    resources :slides
  end
end
