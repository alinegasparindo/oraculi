Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: :show do
<<<<<<< HEAD
    resources :meetings, only: %i(new create)
    resources :experiences
=======
    resources :meetings, only: %i(new create show index)
>>>>>>> c4dcbd0ff52c795d1ff16054c853c4f813287935
  end

  # resources :meetings, only: %i(update destroy)

  get 'user', to: 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
