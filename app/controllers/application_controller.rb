class ApplicationController < ActionController::Base
# 全アクションがログイン中のユーザーを使えるようにする
  before_action :set_current_user
# ログイン中のユーザーを定義
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
# ログインが必要なユーザーを定義
  def authenticate_user
    if session[:user_id] == nil
      flash[:notice]="ログインが必要です"
      redirect_to login_path
    end
  end
# 投稿した本人じゃないと編集をできないように定義
  def ensure_correct_post
      @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to posts_path
      end
  end
# 登録した本人しか自分のプロフィールを編集、閲覧出来ないように定義
  def ensure_correct_user
      @user = User.find_by(id: params[:id])
      if @user.id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to users_path
      end
  end

end
