class SendingDestination < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :family_name, :first_name_kana, :family_name_kana,
            :post_code, :prefecture, :city, :house_number, presence: true
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
end
