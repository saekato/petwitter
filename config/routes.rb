Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  
  resources :articles
  # get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  # トップページのルーティング/ここからﾛｸﾞｲﾝOR新規ｱｶｳﾝﾄの作成
  root to: 'home#index'
  
  get 'users/:id' =>'users#show'
  get 'users', to: 'users#index'
    
  
  #myprofileのﾙｰﾃｨﾝｸﾞ
  get 'users/myprofile' => 'users#myprofile'
  
  
  
  #自分の投稿一覧のﾙｰﾃｨﾝｸﾞ
  get 'mypage/index' => 'mypage#index'
end

  