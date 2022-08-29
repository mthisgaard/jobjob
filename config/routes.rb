Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  root to: "pages#home"
  resources :jobs, only: [:index, :create, :update, :destroy] do
    resources :tasks, only: [:create]
  end
  resources :tasks, only: [:update, :destroy]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :jobs, only: [ :index, :create ]
    end
  end
end
