Rails.application.routes.draw do
  devise_for :users, only: []

  root to: 'application#index'

  get 'auth/:provider/callback', to: 'omniauth#callback'

  resource :users, only: [:update] do
    get '/login', to: 'users#login'
  end

  resources :tournaments, only: [:index] do
    resources :commands, shallow: true, only: [:index, :create, :destroy]
  end

  get '*path', to: 'application#index'
end
