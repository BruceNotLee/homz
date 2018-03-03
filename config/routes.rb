Rails.application.routes.draw do
  resources :pictures

  get 'feed', to: 'pages#feed'
  get 'message', to: 'pages#message'
  get 'home' => 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#landing'

  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'

end
