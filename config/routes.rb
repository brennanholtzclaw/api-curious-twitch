Rails.application.routes.draw do
  get 'sessions/create'

  root 'games#index'

  resources :games, only: [:index, :show]
  resources :users, only: [:index, :show]

  get '/auth/twitch', as: :twitch_login
  get '/auth/twitch/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: "logout"
end
