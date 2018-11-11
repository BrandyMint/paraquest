require 'route_contraints'

Rails.application.routes.draw do
  # Авторизация и аутентификация
  #
  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :user_sessions, only: %i[new create destroy]
  resources :password_resets, only: %i[new create edit update]

  get 'signup' => 'users#new', as: :signup

  resources :users, only: %i[index create show] do
    member do
      get :activate
    end
  end

  resources :password_resets, only: %i[new create edit update]

  # Публичная часть
  #
  resources :slides, only: [:show]
  resources :bundles, only: [:index, :show] do
    resources :slides, only: [:index]
  end

  root to: 'dashboard#index'

  # Private
  #

  resource :profile, only: %i[show edit update]
  namespace :private do
    resources :slide_games, only: [:show] do
      member do
        put :done
      end
    end
    resources :bundle_games
    resources :bundles do
      resources :slides
    end
  end

  # Админка
  #
  namespace :admin do
    resources :games, only: [:index, :destroy]
    resources :users
  end


  # Разработка и поддержка
  #
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development? && defined? LetterOpenerWeb
  mount Sidekiq::Web => '/sidekiq', constraints: RouteConstraints::AdminRequiredConstraint.new
  get '/sidekiq-stats' => proc { [200, { 'Content-Type' => 'text/plain' }, [Sidekiq::Stats.new.to_json]] }
end
