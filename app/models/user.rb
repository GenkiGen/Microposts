class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  has_many :posts

  def create_post(post)
    posts << post
  end

  def public_posts
    posts.where('is_private = ?', false)
  end

  def private_posts
    posts.where('is_private = ?', true)
  end
end
