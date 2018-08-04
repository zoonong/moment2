Rails.application.routes.draw do
  root 'posts#index'
  get '/boards/index' => 'boards#index'
  resources :boards
  get '/profiles/index' => 'profiles#index'
  resources :profiles
  get '/posts/explore' => 'posts#explore'
  get '/posts/intro'  => 'posts#intro'
  resources :posts
  devise_for :users
end
