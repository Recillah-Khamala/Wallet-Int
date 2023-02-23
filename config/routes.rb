Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root "users#index"

  resources :categories
  resources :activities
end
