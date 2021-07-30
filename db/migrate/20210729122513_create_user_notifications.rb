class CreateUserNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_notifications do |t|
      t.references :user, foreign_key: true
      t.references :supplier, foreign_key: true
      t.datetime :checked_at
      t.timestamps
    end
  end
end
