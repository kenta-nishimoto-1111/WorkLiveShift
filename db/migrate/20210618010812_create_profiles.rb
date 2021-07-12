class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.date       :birth_date, null: false
      t.integer    :prefecture_id, null: false
      t.text       :strong_point, null: false
      t.text       :dream, null: false
      t.references :user, null: false, index: { unique: true }
      t.timestamps
    end
    add_index :profiles, :birth_date
    add_index :profiles, :prefecture_id
    add_index :profiles, %i[birth_date prefecture_id]
  end
end
