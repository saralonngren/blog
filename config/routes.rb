Rails.application.routes.draw do
  root to: 'posts#index'
  
  resources :posts
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
