Rails.application.routes.draw do

  resources :users
 resources :posts do
   resources :comments, only: [:create,:destroy]
 end
 root "posts#index"
 get "login" => "users#login_form"
 post "login" => "users#login"
 post "logout" => "users#logout"
end
