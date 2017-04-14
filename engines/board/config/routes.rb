Board::Engine.routes.draw do
  resources :posts do
    resources :messages, only: [:create]
  end
end
