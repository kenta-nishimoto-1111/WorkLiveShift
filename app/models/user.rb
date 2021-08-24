class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :user_question_answers, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :career, dependent: :destroy
  has_many :chats
  has_many :user_notifications, dependent: :destroy
  has_many :supplier_notifications, dependent: :destroy

  has_many :entries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :companies, through: :favorites

  has_one_attached :image

  with_options presence: true do
    validates :family_name
    validates :last_name
    validates :image
  end

  PERSONALITY_TYPE_SCORE_BASE = {
    thinker: 1,
    pasi: 2,
    hamo: 3,
    ima: 4,
    revel: 5,
    pro: 6
  }

  def build_personality_hash
    hash = { 'hamo' => 0, 'pasi' => 0, 'revel' => 0, 'thinker' => 0, 'ima' => 0, 'pro' => 0 }
    user_question_answers.each do |answer|
      hash[answer.personality_type] += answer.point
    end
    hash
  end

  def calc_personality_score
    place = 100_000
    score = 0
    build_personality_hash.sort_by { |_, v| -v }.to_h.each do |personality_type, _score|
      score += place * User::PERSONALITY_TYPE_SCORE_BASE[personality_type.to_sym]
      place /= 10
    end
    score
  end
end
