class CreateSupplierQuestionAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_question_answers do |t|
      t.integer :supplier_id, null: false
      t.integer :question_id,   null: false
      t.string  :personality_type, null: false
      t.integer :point, null: false
      t.timestamps
    end
  end
end
