class Profile < ApplicationRecord
  belongs_to :user, optional: true
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
  validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
  validates :family_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true
end
