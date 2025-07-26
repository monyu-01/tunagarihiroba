class SavedPost < ApplicationRecord
  belongs_to :member
  belongs_to :post

  validates :member, uniqueness: {scope: :post_id}
end
