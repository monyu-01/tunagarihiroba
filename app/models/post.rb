class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre, optional: true
  has_one_attached :image, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default_post_icon_flower.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg') 
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  validates :title,  presence: true
  validates :body, presence: true
end
