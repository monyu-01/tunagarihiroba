
class DeviseCreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :name
      t.text :self_introduction
      
      t.timestamps null: false
    end

    add_index :members, :email,                unique: true
    add_index :members, :reset_password_token, unique: true
  end
end
