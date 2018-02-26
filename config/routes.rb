Rails.application.routes.draw do
  devise_for :users, only: []

  root to: 'application#index'

  get 'auth/:provider/callback', to: 'omniauth#callback'

  resource :users, only: [:update] do
    get '/login', to: 'users#login'
    get '/logout', to: 'users#logout'
  end

  resources :tournaments, only: [:index, :show] do
    resources :teams, shallow: true, only: [:index, :show, :create, :update, :destroy]
  end

  get '*path', to: 'application#index'
end
