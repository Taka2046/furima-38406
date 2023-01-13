class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze

  validates_format_of :password, with: PASSWORD_REGEX
  validates :nickname, presence: true
  validates :firstname_in_kanji, presence: true, format: { with: NAME_REGEX }
  validates :lastname_in_kanji, presence: true, format: { with: NAME_REGEX }
  validates :firstname_in_kana, presence: true, format: { with: KANA_REGEX }
  validates :lastname_in_kana, presence: true, format: { with: KANA_REGEX }
  validates :birthday, presence: true
end
