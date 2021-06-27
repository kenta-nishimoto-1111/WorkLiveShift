class Question < ApplicationRecord

  enum question_type: { choice: 'choice', scale: 'scale' }
  enum personarity_type: { all_personarity: 'all', hamo: 'hamo', thinker: 'thinker', pasi: 'pasi', revel: 'revel', ima: 'ima', pro: 'pro' }

  has_many :question_options
  has_many :user_question_answers
end
