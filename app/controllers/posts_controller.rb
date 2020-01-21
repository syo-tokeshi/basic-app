class PostsController < ApplicationController

  before_action :authenticate_user #←ログインしている人しか投稿を閲覧出来ないように設定
  before_action :ensure_correct_post,{only:[:edit,:destroy,:update]}

  def new
    @post = Post.new
  end

  def index
    if params[:search_content]   #部分一致でcontentを絞り込むためのwhere文
    @posts = Post.where('content Like ?',"%#{params[:search_content]}%").all.order(created_at: :desc).page(params[:page]).per(10)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def create
    post = Post.new(post_params)
    post.user_id =  @current_user.id
    if post.save
    redirect_to posts_path
    else
      flash[:notice] = "両方とも入力してください"
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title,:content)
  end

end
