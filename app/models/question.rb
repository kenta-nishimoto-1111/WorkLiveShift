class Question < ApplicationRecord

  enum question_type: { choice: 1, label: 2 }
  enum personarity_type: { all_personarity: 'all', hamo: 'hamo', thinker: 'thinker', pasi: 'pasi', revel: 'revel', ima: 'ima', pro: 'pro' }

  has_many :question_options
  has_many :user_question_answers
end
