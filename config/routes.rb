Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  resources :subscribers, only: [:new, :create, :index]

  delete '/subscribers', to: 'subscribers#unsubscribe', as: :unsubscribe
  get '/cancel_subscription/:delete_token', to: 'subscribers#cancel_subscription', as: :cancel_subscription

  root to: 'posts#new'
end
