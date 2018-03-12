Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#profile'
  
  get "/users/profile" => "users#profile", as: :users_profile
  
  get "/users/all" => "users#all", as: :users
  get "/users/:id" => 'users#show', as: :user
  
  get "/follow/:id" => 'users#follow', as: :follow_user
  get "/unfollow/:id" => 'users#unfollow', as: :unfollow_user
  
  resources :tweets
end
