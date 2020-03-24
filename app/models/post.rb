class Post < ApplicationRecord

  has_many :comments,dependent: :destroy #ポストはたくさんのコメントとを持つ
  validates  :title,:content, {presence:true}

#投稿詳細画面でユーザー情報を表示するためのメソッド
  def user
    return User.find_by(id: self.user_id)
  end

end
