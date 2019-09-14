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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
