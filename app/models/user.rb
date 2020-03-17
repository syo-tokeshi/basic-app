class User < ApplicationRecord

  def posts
    return Post.where(user_id: self.id)
  end

  validates  :name,presence:true
  validates :email, {presence: true, uniqueness: true}
  validates  :password, presence:true, length: { minimum: 6}

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
