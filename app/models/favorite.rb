class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates :user_id, uniqueness: { scope: :company_id }
  # ↪︎同じユーザーがお気に入りできないように設定
end
