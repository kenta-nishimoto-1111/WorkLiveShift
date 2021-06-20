class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # アソシエーション
  has_many :user_question_answers
  has_one :profile, dependent: :destroy
  has_many :company_names, dependent: :destroy

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :family_name
    validates :name
  end
end
