class AddUserStatusToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :user_status, :integer, default: 0, null: false
  end
end
