class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :message
      t.integer  :sent_person
      t.references :chat, foreign_key: true
      t.timestamps
    end
  end
end
