class Post < ApplicationRecord

  has_many :comments,dependent: :destroy #ポストはたくさんのコメントとを持つ
  # belongs_to :user
  validates  :title,:content, {presence:true}

end
