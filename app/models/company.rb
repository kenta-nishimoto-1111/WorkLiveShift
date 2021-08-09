class Company < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :supplier
  has_many :favorites
  has_many :users, through: :favorites

  INGREDIENTS_MAP = {
    '営業': %w[個人営業 法人営業 ルート営業 テレフォンアポインター 営業アシスタント],
    'コーポレート': %w[一般事務 人事 経理 財務 法務 経営企画 秘書],
    '販売・サービス': ['販売・接客', '店長(ファッション)', 'ホールスタッフ', '調理', '店長(飲食)'],
    'コンサルティング': %w[経営コンサルティング 人事コンサルティング ITコンサルティング マーケティングコンサルティング キャリアコンサルティング],
    '教育': ['保育士・幼稚園教諭', 'スクール運営・マネジメント', '教師', '講師', 'スポーツインストラクター', '教務事務'],
    'エンジニア': %w[モバイルエンジニア webエンジニア インフラエンジニア システムエンジニア データサイエンティストグラフィック],
    'デザイナー': %w[デザイナー アートデザイナー クリエイティブデザイナー フォトグラファー 動画クリエイター イラストレーター]

  }

  # 引数を受け取るように設定
  def already_favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 引数を受け取るように設定
  def already_entries?(user)
    supplier.entries.where(user_id: user.id).exists?
  end

  def self.keyword(keyword)
    where([
            'company_content like? OR company_purpose like? OR company_environment like? OR ingredients like?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
          ])
  end

  def self.genre(genre)
    where(['ingredients like ?', "%#{genre}%"])
  end

  def self.area(area)
    where(prefecture_id: area)
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
