Rails.application.routes.draw do
  get 'home/index'
  get 'home/activity'
  devise_for :users
  resources :howtodos
  resources :users, only: [:index]
  root 'howtodos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
