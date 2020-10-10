Rails.application.routes.draw do
  get "/", to: 'welcome#index', as: :welcome
  post "/dashboard", to: 'users#show'
  get "/register", to: 'users#create'
end
