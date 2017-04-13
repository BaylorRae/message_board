Rails.application.routes.draw do
  devise_for :users
  mount Board::Engine, at: '/'
end
