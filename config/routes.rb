Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :jobs do
    resources :my_jobs, only: [:create ]
  end

  resources :my_jobs, only: [:index]

  resources :reviews, only: [:index, :new, :create]

  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end


  #post "my_jobs,"

  resources :users, only: [ :index, :show ] do
    resources :reviews, only: [ :new, :create ]
  end


end
