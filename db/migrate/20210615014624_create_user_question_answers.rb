class CreateUserQuestionAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_question_answers do |t|
      t.integer :user_id, null: false
      t.integer :question_id,   null: false
      t.integer :question_option_id, null: false
      t.integer :personality_type, null: false
      t.integer :point, null: false
      t.timestamps
    end

    add_index :user_question_answers, :personality_type
    add_index :user_question_answers, [:personality_type, :user_id]

  end
end
