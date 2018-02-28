Rails.application.routes.draw do
  get 'feed', to: 'pages#feed'
  get 'message', to: 'pages#message'
  resources :pictures
  root to: 'pages#home'
end
