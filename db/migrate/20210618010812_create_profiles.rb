class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer    :age, null: false
      t.date       :birth_date, null: false 
      t.integer    :prefecture_id, null: false
      t.text       :strong_point, null: false
      t.text       :dream, null: false
      t.references :user, null: false, index: {unique: true}
      t.timestamps
    end
    add_index :profiles, :age
    add_index :profiles, :prefecture_id
    add_index :profiles, [:age, :prefecture_id]
  end
end
