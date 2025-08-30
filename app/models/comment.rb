class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :post

  scope :with_available_members, -> {
    joins(:member).merge(Member.available).includes(member: { profile_image_attachment: :blob })
  }

  validates :comment_body, presence: true, length: { maximum: 300 }
end
