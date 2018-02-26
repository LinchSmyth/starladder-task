Rails.application.routes.draw do
  devise_for :users, only: []

  root to: 'application#app'

  get 'auth/:provider/callback', to: 'omniauth#callback'

  resource :users, only: [:update] do
    get '/login', to: 'users#login'
    get '/logout', to: 'users#logout'
  end

  namespace :api do
    scope module: :internal, path: '' do
      resources :tournaments, only: [:index, :show] do
        resources :teams, shallow: true, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end

  get '*path', to: 'application#app', constraints: -> (req) do
    !req.xhr? && req.format.html?
  end
end
