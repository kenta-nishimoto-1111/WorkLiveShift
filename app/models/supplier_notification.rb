class SupplierNotification < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
end
