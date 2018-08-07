Rails.application.routes.draw do
  resources :categories
  root 'posts#index'
  get '/boards/index' => 'boards#index'
  resources :boards
  get '/profiles/index' => 'profiles#index'
  resources :profiles
  get '/posts/explore' => 'posts#explore'
  get '/posts/intro'  => 'posts#intro'
  resources :posts
  
  # omniauth : for SNS(facebook) login
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
  
end
