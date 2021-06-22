class CreateCareers < ActiveRecord::Migration[6.0]
  def change
    create_table :careers do |t|
      t.string     :company_name, null: false
      t.string     :position, null: false
      t.date       :period_start, null: false
      t.date       :period_end, null: false
      t.text       :business_content, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
    
    add_index :careers, :position

  end
end
