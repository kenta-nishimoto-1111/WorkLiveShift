class Supplier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies
  has_many :chats, dependent: :destroy
  has_one_attached :company_image

  validates :company_name, presence: true
  validates :company_image, presence: true

end
