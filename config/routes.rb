Rails.application.routes.draw do
  get "/", to: 'welcome#index', as: :welcome
  # resources :welcome, :path => '/', only: :index, as: :welcome

  get '/discover', to: 'search#top_forty'
end
