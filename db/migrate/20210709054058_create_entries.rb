class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :supplier, foreign_key: true
      t.timestamps
    end
  end
end
