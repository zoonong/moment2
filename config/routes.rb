Rails.application.routes.draw do
  get '/boards/index' => 'boards#index'
  resources :boards
  get '/profiles/index' => 'profiles#index'
  resources :profiles
  root 'posts#index'
  get '/posts/explore' => 'posts#explore'
  get '/posts/intro'  => 'posts#intro'
  resources :posts
  devise_for :users
end
