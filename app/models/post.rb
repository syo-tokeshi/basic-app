class Post < ApplicationRecord

  include ActiveModel::Model  # ←postsコントローラーで使用
attr_accessor :search_content

  has_many :comments,dependent: :destroy #ポストはたくさんのコメントとを持つ
  validates  :title,:content, {presence:true}

end
