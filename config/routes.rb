Rails.application.routes.draw do
  get "/", to: 'welcome#index', as: :welcome
  # resources :welcome, :path => '/', only: :index, as: :welcome
  get '/discover', to: 'discover#show'

  get '/movies/top_forty', to: 'movie#top_forty'
  get '/movies/search', to: 'movie#search'
  get '/movies/:id', to: 'movie#show'

  get "/register", to: "users#new"
  post "/users", to: "users#create"
  get "/dashboard", to: "users#show"
  post "/dashboard", to: "sessions#create"
  post "/friends", to: "users#add_friend"
end
