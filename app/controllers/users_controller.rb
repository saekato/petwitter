class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  
  def index
    @serarch_params = user_search_params
    @users = User.search(@search_params)
  end
  
  private
  
  def user_search_params
    params.fetch(:search, {}).permit(:name, :gender)
  end

  def show
    @user = current_user
  end
  
  def logged_in_user
  end
end
