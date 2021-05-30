Rails.application.routes.draw do

  get 'user/index'
  devise_for :users
  root to: 'motions#index'
  resources :meetings
  get 'motion/:id', to: 'motions#checked'
  resources :motions

end
