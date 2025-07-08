class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :post

  scope :with_available_members, -> {
    joins(:member).merge(Member.available).includes(:member)
  }

  validates :comment_body, presence: true
end
