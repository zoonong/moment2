Rails.application.routes.draw do
  root "posts#index"
  resources :categories
  
  get '/posts/explore' => 'posts#explore' 
  get '/posts/intro'  => 'posts#intro'
  resources :posts
  
  #Read
  get 'profile/index'  =>  'profile#index'
  get 'profile/edit' =>  'profile#edit'
  
  
  #get 'board/:user_id/lol' => 'board#lol'
  #get 'board/:user_id/overwatch'
  #get 'board/:user_id/wow'
  get 'board/new'
  post 'board/create' => 'board#create',as: 'create_board'
  get 'board/edit/:board_id'
  post 'board/update/:board_id' => 'board#update'
  post 'board/destroy/:board_id' => 'board#destroy'
  resources :lol
  resources :board
  
  # omniauth : for SNS(facebook) login
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
  
end