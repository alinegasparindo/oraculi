Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: :show do
    resources :meetings, only: %i(new create show index)
    resources :experiences
  end

  resources :meetings, only: %i(update destroy confirm)


  get 'user', to: 'pages#profile'
<<<<<<< HEAD
  get 'team', to: 'pages#team'
  get 'mentoring', to: 'pages#mentoring'
=======
  get 'meeting', to: 'meeting#update'
>>>>>>> afe0304461b2d6aa2955bf3c47d7c6b6b1d9883c
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

