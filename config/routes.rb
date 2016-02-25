Rails.application.routes.draw do
      root to: 'users#home'
      get "/sign-in", to: "sessions#new"
      post "/sessions", to: "sessions#create"
      delete "/sessions", to: "sessions#destroy"
      resources :users
      resources :students
      
      post "users/:user_id/students" => "teacher_students#create", as: "favorite"
end

# Prefix Verb   URI Pattern                        Controller#Action
#   root GET    /                                  users#home
# sign_in GET    /sign-in(.:format)                 sessions#new
# sessions POST   /sessions(.:format)                sessions#create
#        DELETE /sessions(.:format)                sessions#destroy
#  users GET    /users(.:format)                   users#index
#        POST   /users(.:format)                   users#create
# new_user GET    /users/new(.:format)               users#new
# edit_user GET    /users/:id/edit(.:format)          users#edit
#   user GET    /users/:id(.:format)               users#show
#        PATCH  /users/:id(.:format)               users#update
#        PUT    /users/:id(.:format)               users#update
#        DELETE /users/:id(.:format)               users#destroy
# students GET    /students(.:format)                students#index
#        POST   /students(.:format)                students#create
# new_student GET    /students/new(.:format)            students#new
# edit_student GET    /students/:id/edit(.:format)       students#edit
# student GET    /students/:id(.:format)            students#show
#        PATCH  /students/:id(.:format)            students#update
#        PUT    /students/:id(.:format)            students#update
#        DELETE /students/:id(.:format)            students#destroy
# favorite POST   /users/:user_id/students(.:format) teacher_students#create
