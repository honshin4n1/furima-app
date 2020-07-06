class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, password_length: 7..128
        validates :nickname, presence: true, uniqueness: true
        validates :email, presence: true, uniqueness: true, format: { with: /\A[\x21-\x3f\x41-\x7e]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i }
  # has_many :comments, dependent: :destroy
  # has_many :favorites
  # has_many :evaluations
  has_many :items, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one :sending_destination, dependent: :destroy
  has_one :card, dependent: :destroy
end
