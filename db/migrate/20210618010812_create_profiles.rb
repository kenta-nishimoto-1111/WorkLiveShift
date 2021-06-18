class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer    :age, null: false
      t.date       :birth_date, null: false 
      t.integer    :prefecture_id, null: false
      t.text       :strong_point, null: false
      t.text       :dream, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
