class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  scope :published, -> { where(is_published: true) }
end
