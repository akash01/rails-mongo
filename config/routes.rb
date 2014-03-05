Mongoblog::Application.routes.draw do
  
  
  get "home" => "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  
  get "signup" => "users#new"
  #root 'users#index'
  root "static_pages#home"

end
