Rails.application.routes.draw do
  resources :apartments
  root 'apartments#index'
end
