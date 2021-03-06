Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/show", to: "users#show"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "password_resets/new"
    get "password_resets/edit"
    get "sessions/new"
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :users
    resources :account_activations, only: :edit
    resources :password_resets, except: [:destroy, :index, :show]
    resources :microposts, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
  end
end
