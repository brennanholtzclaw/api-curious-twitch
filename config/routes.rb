Rails.application.routes.draw do
  root 'games#index'

  resources :games, only: [:index, :show]
  # resources :users, only: [:index, :show]

  get "/auth/twitch", as: :twitch_login
  get "/auth/twitch/callback", to: "sessions#create"
  # get "/auth/:provider/callback", to: "sessions#create"
  # http://127.0.0.1:3000/auth/twitch/callback
  delete "/logout", to: "sessions#destroy", as: "logout"
end
