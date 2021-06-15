class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string  :message,   null: false
      t.integer :question_type, null: false
      t.string :personality_type, null: false
      t.integer :sort_order, null: false
      t.timestamps
    end
  end
end
