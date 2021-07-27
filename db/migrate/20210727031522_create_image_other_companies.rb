class CreateImageOtherCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :image_other_companies do |t|
      t.string :image_other_company
      t.references :supplier, foreign_key: true
      t.timestamps
    end
  end
end
