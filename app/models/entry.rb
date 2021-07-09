class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  validates :user_id, uniqueness: { scope: :supplier_id }
end
