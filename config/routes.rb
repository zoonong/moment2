Rails.application.routes.draw do
  root "posts#index"
  get '/posts/explore' => 'posts#explore' 
  get '/posts/intro'  => 'posts#intro'
  resources :posts
  
  get 'profile/:profile_id' => 'profile#index', as: 'profile_index'
  get 'profile/:user_id/new' => 'profile#new'
  get 'profile/:user_id/album' => 'profile#album'
  get 'profile/mypage/:user_id' => 'profile#mypage', as: 'mypage'
  post 'profile/:user_id/create' => 'profile#create', as: 'create_profile'
  get 'profile/edit2/:id' =>  'profile#edit2', as: 'edit2_profile'
  post 'profile/update/:id' => 'profile#update'
  get 'profile/show/:id' => 'profile#show'
  post 'profile/delete/:id' => 'profile#delete', as: 'delete_profile'
  resources :profile
  
  get 'board/:id' => 'board#index'
  get 'board/:profile_id/new' => 'board#new'
  post 'board/:profile_id/create' => 'board#create', as: 'create_board'
  get 'board/edit/:id' => 'board#edit'
  post 'board/update/:id' => 'board#update'
  post "board/:board_id/like", to: "likes#like_toggle", as: 'like_board'
  resources :board

  resources :categories, only: [:show]
  
  # omniauth : for SNS(facebook) login
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
  
end