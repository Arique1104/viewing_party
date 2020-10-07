Rails.application.routes.draw do
  get "/", to: 'welcome#index', as: :welcome
  # resources :welcome, :path => '/', only: :index, as: :welcome

end
