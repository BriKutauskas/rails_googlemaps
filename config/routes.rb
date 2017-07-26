Rails.application.routes.draw do


  resources :apartments

  post 'apartments/search'

  root 'apartments#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  

end
