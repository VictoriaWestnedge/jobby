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

<<<<<<< HEAD
   post "my_jobs/change_status", to: "my_jobs#change_status"
=======

  #post "my_jobs,"

  resources :users, only: [ :index, :show ] do
    resources :reviews, only: [ :new, :create ]
  end


>>>>>>> master
end
