class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  has_many :messages
end
