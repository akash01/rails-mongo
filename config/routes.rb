Mongoblog::Application.routes.draw do
  
  root "static_pages#home"

  get "home" => "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get "signup" => "users#new"
  get "signin" => "sessions#new"
  get "signout" => "sessions#destroy"
  
end
