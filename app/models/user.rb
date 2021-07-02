class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # アソシエーション
  has_many :user_question_answers
  has_one :profile, dependent: :destroy
  has_many :career, dependent: :destroy

  has_many :favorites
  has_many :favorite_companies, through: :favorites, source: :event 

  has_one_attached :image


  with_options presence: true do
    validates :family_name
    validates :last_name
  end
end
