Rails.application.routes.draw do
root "homes#home"
get "home" => "homes#home"
get "login" => "users#login_form"
post "login" => "users#login"
post "logout" => "users#logout"

 resources :users
 
 resources :posts do
   resources :comments, only: [:create,:destroy,:edit,:update]
 end


end
