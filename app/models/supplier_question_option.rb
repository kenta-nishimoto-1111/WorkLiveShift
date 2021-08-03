class SupplierQuestionOption < ApplicationRecord
  enum personarity_type: { hamo: 'hamo', thinker: 'thinker', pasi: 'pasi', revel: 'revel', ima: 'ima', pro: 'pro' }

  belongs_to :supplier_question
  has_many :supplier_question_answers
end
