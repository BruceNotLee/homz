Rails.application.routes.draw do

  get 'feed', to: 'pages#feed'
  get 'message', to: 'pages#message'
  root to: 'pages#home'
end
