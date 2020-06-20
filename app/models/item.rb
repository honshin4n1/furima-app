class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  has_many :evaluations
  has_many :favorites
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  belongs_to :postage_payer
  belongs_to :preparation_day
end
