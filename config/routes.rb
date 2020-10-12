Rails.application.routes.draw do
  get "/", to: 'welcome#index', as: :welcome
  # resources :welcome, :path => '/', only: :index, as: :welcome

  get '/discover', to: 'discover#show'
  get '/movies/top_forty', to: 'movie#top_forty'
end
