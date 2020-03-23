Rails.application.routes.draw do

root "homes#home"
get "home" => "homes#home"
get "about" => "homes#about"
get "login" => "users#login_form"
post "login" => "users#login"
post "logout" => "users#logout"
post "likes/:post_id/create" => "likes#create"
post "likes/:post_id/destroy" => "likes#destroy"

 resources :users
 resources :books

 resources :posts do
   resources :comments, only: [:create,:destroy,:edit,:update]
 end

end
