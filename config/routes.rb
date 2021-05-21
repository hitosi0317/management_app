Rails.application.routes.draw do

  get 'user/index'
  devise_for :users
  root to: 'motions#index'
  resources :meetings
  resources :motions, only: [:index, :new, :create, :edit, :update, :destroy, :show]
end
