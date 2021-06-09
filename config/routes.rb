Rails.application.routes.draw do
  resources :articles
  get 'users/show' =>'users#show'
  get 'users', to: 'users#index'
    devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  
  #myprofileのﾙｰﾃｨﾝｸﾞ
  get 'users/myprofile' => 'users#myprofile'
  
  # マイページのルーティング
  # get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  # トップページのルーティング
  root to: 'home#index'
  
  
  
  #自分の投稿一覧のﾙｰﾃｨﾝｸﾞ
  get 'mypage/index' => 'mypage#index'
end

  