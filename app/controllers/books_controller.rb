class BooksController < ApplicationController
  before_action :authenticate_user #←ログインしている人しか投稿を閲覧出来ないように設定
  # before_action :ensure_correct_book,{only:[:edit,:destroy,:update]}
  before_action :set_book,{only:[:edit,:destroy,:update,:show]}

  def new
    @book = Book.new
  end

  def index
    if params[:search_content]   #部分一致でcontentを絞り込むためのwhere文
    @books = Book.where('content Like ?',"%#{params[:search_content]}%").all.order(created_at: :desc).page(params[:page]).per(10)
    else
      @books = Book.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def create
    book = Book.new(book_params)
    book.user_id =  @current_user.id
    if book.save
    flash[:notice] = "投稿されました"
    redirect_to books_path
    else
      flash[:notice] = "両方とも入力してください"
      redirect_to new_book_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    flash[:notice] = "変更されました"
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    flash[:notice] = "削除されました"
    redirect_to posts_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:comment,:price)
  end

  def set_book
      @book = Book.find(params[:id])
  end
end
