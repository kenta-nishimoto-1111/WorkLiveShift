class CreateSupplierQuestionOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_question_options do |t|
      t.integer :question_id, null: false
      t.string  :option_text
      t.string  :personality_type
      t.integer :point, null: false
      t.integer :sort_order, null: false
      t.timestamps
    end
  end
end
