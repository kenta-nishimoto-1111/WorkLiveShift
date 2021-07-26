class Company < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :supplier
  has_many :favorites
  has_many :users, through: :favorites

  # 引数を受け取るように設定
  def already_favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 引数を受け取るように設定
  def already_entries?(user)
    supplier.entries.where(user_id: user.id).exists?
  end

  def self.keyword(keyword)
    self.where([
                    'company_content like? OR company_purpose like? OR company_environment like? OR ingredients like?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
                  ])
  end

  def self.area(area)
    self.where(prefecture_id: area)
  end

  # ビュー数獲得のための記述
  is_impressionable

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
