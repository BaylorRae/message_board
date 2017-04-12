Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  mount Board::Engine, at: '/board'
end
