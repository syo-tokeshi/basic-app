Rails.application.routes.draw do
root "homes#home"
get "home" => "homes#home"
get '/posts/search', to: 'posts#search'
  resources :users
 resources :posts do
   resources :comments, only: [:create,:destroy]
 end
 get "login" => "users#login_form"
 post "login" => "users#login"
 post "logout" => "users#logout"

end
