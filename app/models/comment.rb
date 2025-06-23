class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :post

  validates :comment_body, presence: true
end
