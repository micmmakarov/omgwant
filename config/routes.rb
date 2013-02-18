Omgwant::Application.routes.draw do

  devise_for :users
  #resources :users

  namespace :api do
    resources :images do
      resources :comments
    end
    resources :users
    resources :products
    resources :comments
    resources :myimages
    match "like/:id" => "images#like"
    match "follow/:id" => "users#follow"
    get ":id/likes" => "images#user_likes"
    get "feed" => "users#feed"

    get "categories/:category/images" => "images#index"
    #products
    get "images/:id/products" => "products#index"
    put "images/:image_id/products/:id" => "products#update"
    delete "images/:image_id/products/:id" => "products#destroy"
    post "images/:image_id/products" => "products#create"
    #comment
    #get "images/:id/comments" => "comments#index"
    #put "images/:image_id/comments/:id" => "comments#update"
    #delete "images/:image_id/comments/:id" => "comments#destroy"
    #post "images/:image_id/comments" => "comments#create"

    get "users/:id/likes" => "users#user_likes"
    get "users/:id/published" => "users#user_published"
    match "search" => "products#search"
  end

  get "auth" => "sessions#instagram_auth"
  #get "dashboard" => "home#dashboard"
  get "callback" => "sessions#callback"
  get "images/post/:id" => "api#post"
  get "embed/:code" => "images#embed"

  get "authenticate" => "sessions#auth"
  get ":provider/callback" => "sessions#callbacks"
  post "images/publish/:id" => "images#publish"


  get "sessions/callback"
  get "recache" => "admin#recache"

  root :to => 'home#index'

  match '*path' => "home#index"




end
