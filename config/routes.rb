Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  resources :subscribers, only: [:new, :create, :index]

  root to: 'posts#new'
end
