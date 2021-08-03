class CreateSupplierQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_questions do |t|
      t.string :message, null: false
      t.integer :sort_order, null: false
      t.timestamps
    end
  end
end
