class UserQuestionAnswer < ApplicationRecord
  enum personarity_type: { hamo: 'hamo', thinker: 'thinker', pasi: 'pasi', revel: 'revel', ima: 'ima', pro: 'pro' }

  belongs_to :user
  belongs_to :question
  belongs_to :question_option, optional: true

  with_options presence: true, numericality: { other_than: 0 } do
    validates :point
  end
end
