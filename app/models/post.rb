class Post < ApplicationRecord

  has_many :comments,dependent: :destroy #ポストはたくさんのコメントとを持つ
  validates  :title,:content, {presence:true}

end
