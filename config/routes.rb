Rails.application.routes.draw do

  #アプリケーションの前に表示されるwebサイト
  root to: "introduction#top"
  get 'introduction/information'

  # deviseコントローラー
  devise_for :users,
             controllers:{
                 registrations: 'users/registrations',
                 omniauth_callbacks: 'users/omniauth_callbacks'
             }
  resources :users

  #homeコントローラー
  get 'home', to: "home#index"
  get 'home/index'
  get 'home/show'
  get 'home/get_current_location'
end
