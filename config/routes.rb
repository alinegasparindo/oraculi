Rails.application.routes.draw do
  get 'experiences/new'
  get 'experiences/update'
  get 'experiences/destroy'
  get 'experiences/index'
  get 'meetings/new'
  get 'meetings/show'
  get 'meetings/update'
  get 'meetings/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :meetings

  resources :experiences

  get 'user', to: 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
