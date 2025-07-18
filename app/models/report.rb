class Report < ApplicationRecord
  belongs_to :reporter, class_name: 'Member'
  belongs_to :reported, class_name: 'Member'

  validates :reason, presence: true, length: { in: 20..300 }
  validates :reporter_id, uniqueness: { scope: :reported_id }

  after_create :update_user_status

  def self.reported_count(member_id)
    where(reported_id: member_id).count
  end

  def update_user_status
    reported_member = Member.find(reported_id)
    if reported_member.report_count >= 3
      reported_member.update(user_status: :suspended)
    end
  end
end
