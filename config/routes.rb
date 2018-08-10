Rails.application.routes.draw do
  root "posts#index"
  get '/posts/explore' => 'posts#explore' 
  get '/posts/intro'  => 'posts#intro'
  resources :posts
  
  get 'profile/:user_id' => 'profile#index', as: 'profile_index'
  get 'profile/:user_id/new' => 'profile#new'
  post 'profile/:user_id/create' => 'profile#create', as: 'profile_create'
  get 'profile/edit2/:id' =>  'profile#edit2'
  post 'profile/update/:id' => 'profile#update'
  get 'profile/show/:id' => 'profile#show'
  post 'profile/delete/:id' => 'profile#delete'
  resources :profile
  
  get 'board/:profile_id' => 'board#index'
  get 'board/:profile_id/new' => 'board#new'
  post 'board/:profile_id/create' => 'board#create', as: 'create_board'
  get 'board/show/:id' => 'board#show'
  resources :board
  
  resources :categories, only: [:show]
  
  # omniauth : for SNS(facebook) login
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
  
end