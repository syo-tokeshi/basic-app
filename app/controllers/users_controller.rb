class UsersController < ApplicationController
  # ログインしていないとユーザー情報を見れないように設定
  before_action :authenticate_user,{only:[:show,:index]}
  # 登録した本人しか自分のプロフィールを編集、削除出来ないように設定
  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}

  def new
    @user = User.new
  end

  def create
    @user  = User.new(user_params)
    if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "登録しました"
    redirect_to users_path
    else
    render new_user_path
    end
  end

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def login_form
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
   session[:user_id] = nil
    redirect_to users_path
  end
  def login
    user = User.find_by(email:params[:email],password:params[:password])
    if user
    session[:user_id] = user.id
    flash[:notice] = "ログインしました"
    redirect_to users_path
    else
    redirect_to login_path
    flash[:notice] = "正しい値を入力してください"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end
