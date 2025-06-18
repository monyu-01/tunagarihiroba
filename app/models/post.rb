class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre, optional: true
  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saved_posts, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default_post_icon_flower.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg') 
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def saved_post_by?(member)
    saved_posts.exists?(member_id: member.id)
  end

  validates :title,  presence: true
  validates :body, presence: true
end
