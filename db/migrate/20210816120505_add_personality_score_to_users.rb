class AddPersonalityScoreToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :personality_score, :integer, null: false, default: 0
  end
end
