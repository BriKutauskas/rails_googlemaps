Rails.application.routes.draw do


  get 'admin/index'

  get 'admin/update'

  resources :apartments


  root 'apartments#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "admin" => "admin#index"
  put "admin/:id" => "admin#update"
  patch "admin/:id" => "admin#update"

end
