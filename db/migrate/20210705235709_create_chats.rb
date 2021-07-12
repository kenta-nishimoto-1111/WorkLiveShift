class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.text :latest_message
      t.datetime :latest_message_time
      t.references :user, foreign_key: true
      t.references :supplier
      t.timestamps
    end
  end
end
