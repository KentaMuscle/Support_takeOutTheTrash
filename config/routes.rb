Rails.application.routes.draw do

  root to: "home#index"

  # deviseコントローラー
  devise_for :users
  resources :users

  #homeコントローラー
  get 'home', to: "home#index"
  get 'home/index'
  get 'home/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
