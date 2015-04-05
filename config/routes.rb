Rails.application.routes.draw do
  get "/email_sent/:id", to: "static_pages#email_sent", as: "email_sent"
  get "/sign_in", to: "static_pages#sign_in"
  get "/sign_up", to: "static_pages#sign_up"

  resources :users, only: :create
end
