Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :jobs do
    resources :my_jobs, only: [:create]
  end

  resources :reviews, only: [:index, :new, :create]

  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end

end
