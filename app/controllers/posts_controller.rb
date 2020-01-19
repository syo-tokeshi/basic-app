class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user,{only:[:edit,:destroy,:update]}

  def index
    if params[:search_content]
    @posts = Post.where('content Like ?',"%#{params[:search_content]}%").all.order(created_at: :desc).page(params[:page]).per(10)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to posts_path
    else
      render new_post_path
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
  def search
    post_search = PostSearch.new(params_post_search)
    @posts = post_search.execute
  end
  private
  def post_params
    params.require(:post).permit(:title,:content,:image)
  end
  def params_post_search
  params.permit(:search_title, :search_content)
  end
end
