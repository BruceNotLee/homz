Rails.application.routes.draw do
  resources :pictures

  get 'feed', to: 'pages#feed'
  get 'message', to: 'pages#message'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
end
