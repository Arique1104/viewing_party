Rails.application.routes.draw do
  get "/", to: 'welcome#index', as: :welcome
  post "/dashboard", to: 'user#show'
end
