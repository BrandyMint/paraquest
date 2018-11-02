Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development? && defined? LetterOpenerWeb

  get 'user_games/index'
  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :user_sessions, only: %i[new create destroy]
  resources :password_resets, only: %i[new create edit update]

  get 'signup' => 'users#new', as: :signup

  resource :profile, only: %i[show edit update]
  resources :users, only: %i[create show] do
    member do
      get :activate
    end
  end

  resources :password_resets, only: %i[new create edit update]
  resources :slides, only: [:index, :show]
  resources :games, only: [:new, :create]

  resources :user_games, only: [:index]

  root to: 'dashboard#index'

  namespace :admin do
    resources :games, only: [:index, :destroy]
    resources :users
    resources :slides
  end
end
