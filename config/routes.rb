Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :jobs, only: [:index, :create, :update] do
    resources :tasks, only: [:create]
  end
  resources :tasks, only: [:update]
end
