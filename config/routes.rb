Rails.application.routes.draw do
  get "/", to: 'welcome#index', as: :welcome
  # resources :welcome, :path => '/', only: :index, as: :welcome
  get "/register", to: "users#new"
  post "/users", to: "users#create"
  get "/dashboard", to: "users#show"
end
