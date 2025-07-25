class Genre < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
