Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#profile'
  
  get "/users/profile" => "users#profile", as: :users_profile
end
