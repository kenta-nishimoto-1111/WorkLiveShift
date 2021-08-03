class SupplierQuestion < ApplicationRecord
  has_many :supplier_question_options
  has_many :supplier_question_answers
end
