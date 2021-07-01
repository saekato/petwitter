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
  
  def destroy
    @user.remove_icon!
    @user.save
  end
  
  private
  
  #permitに:imageを追加
  def user_search_params
    params.fetch(:search, {}).permit(:name, :gender)
  end
  

  
end
