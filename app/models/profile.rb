class Profile < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  with_options presence: true do
    validates :birth_date
    validates :prefecture_id
    validates :strong_point
    validates :dream
  end

end

