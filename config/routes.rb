Rails.application.routes.draw do
  # get 'chat_stream', to: 'chat_stream#index'

  get 'stream/index'
  get 'rack/stream'
  # resources :stream, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
