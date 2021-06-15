class Question < ApplicationRecord
  has_many :question_options
  has_many :user_question_answers
end
