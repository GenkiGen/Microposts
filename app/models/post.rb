class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  def toggle_private(is_private) 
    self.is_private = is_private
  end

  def private?
    self.is_private
  end
end
