class UsersController < ApplicationController
  #ﾛｸﾞｲﾝしてない場合はﾛｸﾞｲﾝﾍﾟｰｼﾞへﾘﾀﾞｲﾚｸﾄ
  before_action :authenticate_user!
  
  def index
    @search_params = user_search_params
    @users = User.search(@search_params).where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def logged_in_user
  end
  
  def myprofile
    @user = current_user
  end
  
  private
  
  #permitに:imageを追加
  def user_search_params
    params.fetch(:search, {}).permit(:name, :gender, :icon)
  end
  
  def update
    @user = User.find(params[:id])
 
  #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
      if current_user == @user
 
        if @user.update(user_params)
          flash[:success] = 'ユーザー情報を編集しました。'
          render :edit
        else
          flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
          render :edit
        end   
   
      else
        redirect_to root_url
      end
      
  end
  
end
