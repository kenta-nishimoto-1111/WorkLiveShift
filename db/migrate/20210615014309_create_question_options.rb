class CreateQuestionOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :question_options do |t|
      t.integer :question_id, null: false
      t.string  :question_text,   null: false
      t.integer :personarity_type, null: false
      t.integer :point, null: false
      t.integer :sort_order, null: false
      t.timestamps
    end
  end
end
