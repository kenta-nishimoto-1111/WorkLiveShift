class QuestionOption < ApplicationRecord
  enum personarity_type: { hamo: 'hamo', thinker: 'thinker', pasi: 'pasi', revel: 'revel', ima: 'ima', pro: 'pro' }

  belongs_to :question
  has_many :user_question_answers
end
