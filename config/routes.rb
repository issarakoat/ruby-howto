Rails.application.routes.draw do
  get 'home/index'
  get 'home/activity'
  get 'analytics', to: 'home#analytics'
  get 'charts/users_per_day', to: 'charts#users_per_day'
  get 'charts/comments_per_day', to: 'charts#comments_per_day'
  get 'charts/ratings_per_day', to: 'charts#ratings_per_day'
  devise_for :users
  resources :howtodos do
    resources :comments
    resources :ratings
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'howtodos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
