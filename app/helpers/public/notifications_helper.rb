module Public::NotificationsHelper
  def unchecked_notifications
    current_member.passive_notifications.where(checked: false)
  end
end
