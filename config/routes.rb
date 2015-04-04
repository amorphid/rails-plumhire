Rails.application.routes.draw do
  get "/email_sent/:id", to: "static_pages#email_sent", as: "email_sent"
  get "/sign_up", to: "users#new"

  resources :users, only: :create
end
