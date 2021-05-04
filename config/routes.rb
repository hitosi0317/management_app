Rails.application.routes.draw do
  devise_for :users
  root to: 'motions#index'
  resources :motions, only: :index
end
