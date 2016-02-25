Rails.application.routes.draw do
      root to: 'users#home'
      get "/sign-in", to: "sessions#new"
      post "/sessions", to: "sessions#create"
      delete "/sessions", to: "sessions#destroy"
      resources :users
      resources :students
      post "users/:user_id/students" => "teacher_students#create", as: "favorite"
end
