Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: :show do
    resources :meetings, only: %i(new create show index)
    resources :experiences
  end

  resources :meetings, only: %i(update destroy confirm)


  get 'user', to: 'pages#profile'

  get 'meeting', to: 'meeting#update'
 #22 from alinegasparindo/final-work-of-lotfi
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

