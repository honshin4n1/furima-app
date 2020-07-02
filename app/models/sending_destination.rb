class SendingDestination < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :family_name, :first_name_kana, :family_name_kana,
            :prefecture, :city, :house_number, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, uniqueness: true
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
end
