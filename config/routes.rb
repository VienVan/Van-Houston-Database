Rails.application.routes.draw do
      root to: 'users#home'
      get "/sign-in", to: "sessions#new"
      post "/sessions", to: "sessions#create"
      delete "/sessions", to: "sessions#destroy"
      resources :users
      resources :students
      resources :teacher_students
end
