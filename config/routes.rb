Rails.application.routes.draw do

  root 'pages#landing'

  get 'comments/create'
  resources :favorites, only: [:create,:destroy]

  resources :pictures, only: [:new,:create,:edit,:show,:destroy]

  get 'feed', to: 'pages#feed'
  get 'message', to: 'pages#message'
  get 'home' => 'pages#home'
  get 'favorites' => 'pages#favorites', as: "my_favorites"
  post '/feed' => "pages#feed", as: "feed_post"
  get '/pics' => "pages#pics"
  get 'upload' => 'pictures#new'
  get 'profile' => 'pages#profile', as: "profile"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", sessions: 'users/sessions' }

  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
  get '/join_chat' => "chat_rooms#create"

  resources :comments, only: [:new, :create]
  post 'favorites/:id' => 'favorites#favorite'

  delete 'unfavorite/:id' => 'favorites#unfavorite', as: 'unfavorite'

  get 'style' => 'pages#styleguide'

end
