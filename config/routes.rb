Rails.application.routes.draw do
  devise_for :users, only: []

  root to: 'application#index'

  get 'auth/:provider/callback', to: 'omniauth#callback'

  resource :users, only: [:update] do
    get '/login', to: 'users#login'
  end

  get '*path', to: 'application#index'
end
