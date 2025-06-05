class Post < ApplicationRecord
  belongs_to :member
  has_one_attached :image

  validates :title,  presence: true
  validates :body, presence: true
end
