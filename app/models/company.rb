class Company < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :supplier
  has_many :chats, dependent: :destroy
  has_many :favorites
  has_many :users, through: :favorites

  def already_favorited?(user) #引数を受け取るように設定
    favorites.where(user_id: user.id).exists?
  end
  
  with_options presence: true do
    validates :prefecture_id
    validates :founding_date
    validates :phone_number
    validates :company_url
    validates :company_content
    validates :company_purpose
    validates :company_environment
    validates :ingredients
  end
end