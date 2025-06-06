class Post < ApplicationRecord
  belongs_to :member
  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg') #仮画像
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  validates :title,  presence: true
  validates :body, presence: true
end
