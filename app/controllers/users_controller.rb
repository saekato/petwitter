class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user, only: [:index, :edit, :update]
  
  def index
    @search_params = user_search_params
    @users = User.search(@search_params)
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
  
  def user_search_params
    params.fetch(:search, {}).permit(:name, :gender)
  end
  
  
end
