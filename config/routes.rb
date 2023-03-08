Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :jobs do
    resources :my_jobs, only: [:new, :create, :update]
  end

  resources :reviews, only: [:index, :new, :create]

  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end

  resources :users, only: [ :index, :show ] do
    resources :reviews, only: :create
  end

end
