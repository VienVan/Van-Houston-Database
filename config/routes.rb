Rails.application.routes.draw do
      root to: 'users#index'
      get "/sign-in", to: "sessions#new"
      post "/sessions", to: "sessions#create"
      delete "/sessions", to: "sessions#destroy"
      resources :users
      resources :students
end
