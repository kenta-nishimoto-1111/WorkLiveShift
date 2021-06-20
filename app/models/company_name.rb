class CompanyName < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :position
    validates :period_start
    validates :period_end
    validates :business_content
  end
  
end


