class ImageOtherCompany < ApplicationRecord
  belongs_to :supplier
  has_one_attached :image_other_company
end
