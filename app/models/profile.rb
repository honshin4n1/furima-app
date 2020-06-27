class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :family_name, 
            :first_name_kana, :family_name_kana, 
            :year, :month, :day, presence: true
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
end
