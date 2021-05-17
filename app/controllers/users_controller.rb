class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end
end
