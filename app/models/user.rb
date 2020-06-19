class User < ApplicationRecord
  has_many: comments, dependent: destroy
  has_many: favorites
  has_many: evaluations
  has_one: profile, dependent: destroy
  has_one: sending_destination, dependent: destroy
  has_one: credit_card, dependent: destroy
end
