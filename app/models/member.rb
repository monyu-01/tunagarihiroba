class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Deviseの標準ログイン条件に加えて、独自の条件 available? を追加
  # available? が false の場合はログイン不可 (利用停止中)      
  def active_for_authentication?
    super && available?
  end
  
  # ログインできない場合のメッセージをカスタマイズ
  # アカウントが suspended? の場合は :suspended を返し、それ以外はDeviseのデフォルトに従う
  def inactive_message
    suspended? ? :suspended : super
  end

  enum user_status: { available: 0, suspended: 1 }

  scope :available, -> { where(user_status: :available) }

  has_one_attached :profile_image, dependent: :destroy  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saved_posts, dependent: :destroy
  has_many :saved_posts_posts, through: :saved_posts, source: :post
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships,source: :follower
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :reports_made, class_name: "Report", foreign_key: "reporter_id", dependent: :destroy
  has_many :reports_received, class_name: "Report", foreign_key: "reported_id", dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }, on: :update_profile
  validates :self_introduction, length: { maximum: 500 }, allow_blank: true, on: :update_profile
  validates :user_status, presence: true

  scope :only_available, -> {
    merge(Member.available)
  }

  def report_count
    Report.where(reported_id: id).count
  end

  def exceeded_report_limit?
    report_count >= 3
  end

  GUEST_MEMBER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_MEMBER_EMAIL) do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "guestuser"
    end
  end

  def guest?
    email == GUEST_MEMBER_EMAIL
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default_profile_icon_flower.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end

  def follow(member)
    active_relationships.create(followed_id: member.id)
  end

  def unfollow(member)
    active_relationships.find_by(followed_id: member.id).destroy
  end

  def remove_follower(member)
    passive_relationships.find_by(follower_id: member.id)&.destroy
  end

  def following?(member)
    followings.include?(member)
  end

  def create_notification_follow!(current_member)
    # 既にフォロー通知が存在しない場合のみ、新規通知を作成
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_member.id, id, 'follow'])
    if temp.blank?
      notification = current_member.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
