class BooksController < ApplicationController
  before_action :authenticate_user #←ログインしている人しか投稿を閲覧出来ないように設定
  before_action :set_book,{only:[:edit,:destroy,:update,:show]}

  def new
    @book = Book.new
  end

  def index
      @books = Book.all.order(created_at: :desc).page(params[:page]).per(10)

    minimum_book_price = Book.minimum(:price)
    @minimum_book = Book.find_by(price:minimum_book_price)

    @books_average = Book.average(:price)

    miximum_book_price = Book.maximum(:price)
    @miximum_book = Book.find_by(price:miximum_book_price)
  end

  def create
    book = Book.new(book_params)
    book.user_id =  @current_user.id
    if book.save
    flash[:notice] = "投稿されました"
    redirect_to books_path
    else
      flash[:notice] = "全て入力してください ※値段は数字のみでお願いします"
      redirect_to new_book_path
    end
  end

  def show
    range = (13..42).to_a
    @books_reviews = ["この本は最高に良い本だと思う！大変おすすめ！買った方がいいよ！♪",
                      "この本に巡り合えたあなたは世界で#{range.shuffle[0]}番目にラッキーな人間だ！おすすめの本だよ！",
                      "明日にでもすぐに買ったほうがいいよ！売り切れる予感満載！"]
  end

  def edit
  end

  def update
    @book.update(book_params)
    flash[:notice] = "変更されました"
    redirect_to books_path
  end

  def destroy
    @book.delete
    flash[:notice] = "削除されました"
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:comment,:price,:category)
  end

  def set_book
      @book = Book.find(params[:id])
  end
end
