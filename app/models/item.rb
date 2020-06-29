class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  has_many :evaluations
  has_many :favorites
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :postage_payer
end