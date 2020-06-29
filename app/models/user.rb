class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :comments, dependent: :destroy
  # has_many :favorites
  # has_many :evaluations
  # has_one :profile, dependent: :destroy
  # has_one :sending_destination, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :cards
end
