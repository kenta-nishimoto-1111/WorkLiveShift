class ImageOtherCompany < ApplicationRecord
  belongs_to :supplier
  has_one_attached :image_other_company

  validates :image_other_company, presence: true
end
