class Company < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  
  with_options presence: true do
    validates :my_company_name
    validates :company_image
    validates :prefecture_id
    validates :founding_date
    validates :phone_number
    validates :company_url
    validates :company_content
    validates :company_purpose
    validates :company_environment
    validates :ingredients
  end
  mount_uploader :company_image, CompanyImageUploader
end