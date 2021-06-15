class CreateUserQuestionAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_question_answers do |t|
      t.integer :user_id, null: false
      t.integer :question_id,   null: false
      t.integer :question_option_id, null: false
      t.integer :personarity_type, null: false
      t.integer :point, null: false
      t.timestamps
    end
  end
end
