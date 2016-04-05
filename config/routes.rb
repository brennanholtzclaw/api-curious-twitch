Rails.application.routes.draw do
  get 'games/index'

  get 'sessions/create'

  root 'games#index'
end
