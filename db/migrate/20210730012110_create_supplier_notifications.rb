class CreateSupplierNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_notifications do |t|
      t.references :user, foreign_key: true
      t.references :supplier, foreign_key: true
      t.string :notification_type
      t.datetime :checked_at
      t.timestamps
    end
  end
end
