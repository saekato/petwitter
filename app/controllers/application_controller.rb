class ApplicationController < ActionController::Base
  
    protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :age, :animal_type, :icon])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :age, :animal_type, :icon, :remove_icon])
  end
end
