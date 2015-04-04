Rails.application.routes.draw do
  get "/email_sent", to: "static_pages#email_sent"
  get "/sign_up", to: "users#new"

  resources :users, only: :create
end
