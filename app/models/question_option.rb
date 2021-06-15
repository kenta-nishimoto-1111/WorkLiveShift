class QuestionOption < ApplicationRecord
  belongs_to :question
  has_many :user_question_answers
end
