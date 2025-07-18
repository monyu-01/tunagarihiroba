class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre, optional: true
  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saved_posts, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
  
  scope :with_available_members, -> {
    joins(:member).merge(Member.available).includes(:member, :genre)
  }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default_post_icon_flower.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg') 
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

  def saved_post_by?(member)
    saved_posts.exists?(member_id: member.id)
  end

  def create_notification_comment!(current_member, comment_id)
    return if member_id == current_member.id  
    save_notification_comment!(current_member, comment_id, member_id)
  end

  def save_notification_comment!(current_member, comment_id, visited_id)
    notification = current_member.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
