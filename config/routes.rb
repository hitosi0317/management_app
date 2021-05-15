Rails.application.routes.draw do
  get 'user/index'
  devise_for :users
  root to: 'motions#index'
  resources :motions, only: [:index, :new, :create, :edit, :update, :destroy]
end
