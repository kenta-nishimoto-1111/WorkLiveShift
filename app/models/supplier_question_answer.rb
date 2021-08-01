class SupplierQuestionAnswer < ApplicationRecord
  enum personarity_type: { hamo: 'hamo', thinker: 'thinker', pasi: 'pasi', revel: 'revel', ima: 'ima', pro: 'pro' }

  belongs_to :supplier
  belongs_to :supplier_question
  belongs_to :supplier_question_option

  with_options presence: true, numericality: { other_than: 0 } do
    validates :point
  end
end
