Rails.application.routes.draw do
  devise_for :users

  root to: 'board/posts#index'

  mount Board::Engine, at: '/board'

  get '/account', to: 'users#edit'
  patch '/account', to: 'users#update'
end
