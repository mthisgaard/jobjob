Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :jobs, only: [:index, :create, :update, :destroy] do
    resources :tasks, only: [:create]
  end
  resources :tasks, only: [:update, :destroy]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :jobs, only: [ :index, :create ]
      post '/auth/login', to: 'authentication#login'
      resources :emails, only: [ :create ]
    end
  end
end
