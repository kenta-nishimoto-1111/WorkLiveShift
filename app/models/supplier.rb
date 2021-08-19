class Supplier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :supplier_question_answers, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :image_other_companies, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :user_notifications, dependent: :destroy
  has_many :supplier_notifications, dependent: :destroy
  has_one_attached :company_image

  validates :company_name, presence: true
  validates :company_image, presence: true

  PERSONALITY_TYPE_SCORE_BASE = {
    thinker: 1,
    pasi: 2,
    hamo: 3,
    ima: 4,
    revel: 5,
    pro: 6
  }

  def build_personality_hash
    supplier_answers = supplier_question_answers
    hash = { 'hamo' => 0, 'pasi' => 0, 'revel' => 0, 'thinker' => 0, 'ima' => 0, 'pro' => 0 }
    supplier_answers.each do |answer|
      hash[answer.personality_type] += answer.point
    end
    hash
  end

  def calc_personality_score
    place = 100_000
    score = 0
    build_personality_hash.sort_by { |_, v| -v }.to_h.each do |personality_type, _score|
      score += place * Supplier::PERSONALITY_TYPE_SCORE_BASE[personality_type.to_sym]
      place = place / 10  
    end
    score
  end
end
