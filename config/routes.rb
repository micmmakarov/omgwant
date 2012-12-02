Omgwant::Application.routes.draw do

  devise_for :users
  #resources :users

  namespace :api do
    resources :images
    resources :users
    match "like/:id" => "images#like"
    get ":id/likes" => "images#user_likes"
    get "users/:id/likes" => "users#user_likes"
  end

  get "auth" => "sessions#instagram_auth"
  get "dashboard" => "home#dashboard"
  get "callback" => "sessions#callback"
  get "images/post/:id" => "api#post"
  get "embed/:code" => "images#embed"

  get "authenticate" => "sessions#auth"
  get ":provider/callback" => "sessions#callbacks"
  post "images/publish/:id" => "images#publish"


  get "sessions/callback"


  root :to => 'home#index'

  match '*path' => "home#index"




end
