class ApplicationController < ActionController::Base
  before_action :set_current_user

    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end

  def authenticate_user
    if session[:user_id] == nil
      flash[:notice]="ログインが必要です"
      redirect_to login_path
    end
  end
  def ensure_correct_user
      @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to posts_path
      end
  end
end
