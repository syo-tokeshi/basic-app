class User < ApplicationRecord

  def posts
    return Post.where(user_id: self.id)
  end

  validates  :name,presence:true
  validates :email, {presence: true, uniqueness: true}
  validates  :password, presence:true, length: { minimum: 6}
end
