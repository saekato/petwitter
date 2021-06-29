Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  
  resources :articles
  # get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  # トップページのルーティング/ここからﾛｸﾞｲﾝOR新規ｱｶｳﾝﾄの作成
  root to: 'home#index'
  
  #myprofileのﾙｰﾃｨﾝｸﾞ
  get 'users/myprofile' => 'users#myprofile'
  get 'users/:id' =>'users#show'
  get 'users', to: 'users#index'
  
  #自分の投稿一覧のﾙｰﾃｨﾝｸﾞ
  get 'mypage/index' => 'mypage#index'
  get 'users/articles/:id' => 'articles#otherIndex'
  #articles/〇〇すべてを読み込むので注意が必要。下に位置させる
  get 'articles/:id' => 'article#show'
end

  