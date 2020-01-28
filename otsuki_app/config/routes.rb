Rails.application.routes.draw do
  resources :home
  root 'home#top' 


  get "users/index" => "users#index"
  get "users/member" => "users#member"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  post "users/:id/update" => "users#update"
  get "posts/news" => "posts#news"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/create" => "posts#create"
  post "postsnews/create" => "posts#create"
  get "/" => "home#top"
  get "history" => "home#history"

  get "photo" => "home#photo"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"


  get "users/:id/edit" => "users#edit"






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
