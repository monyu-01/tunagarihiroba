class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Member"
  belongs_to :followed, class_name: "Member"

  validates :follower_id, uniqueness: { scope: :followed_id }
end
