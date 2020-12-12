Rails.application.routes.draw do
  get 'home/index'
  get 'home/activity'
  devise_for :users
  resources :howtodos do
    resources :comments
    resources :ratings
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'howtodos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
