class ApplicationController < ActionController::Base

  def authenticate_user
    if session[:user_id] == nil
      flash[:notice]="ログインが必要です"
      redirect_to login_path
    end
  end
end
