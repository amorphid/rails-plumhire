Rails.application.routes.draw do
  get "/email_sent/:id", to: "static_pages#email_sent", as: "email_sent"
  get "/home", to: "static_pages#home"
  get "/sign_in", to: "static_pages#sign_in"
  get "/sign_up", to: "static_pages#sign_up"

  resources :companies, only: [:create, :new, :show] do
    resources :jobs, only: [:create, :new, :show]
  end

  resources :jobs, only: [] do
    resources :applications, only: [:create, :new]
  end

  resources :sign_ins, only: :create
  resources :sign_ups, only: :create
end
