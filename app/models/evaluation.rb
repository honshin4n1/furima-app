class Evaluation < ApplicationRecord
  belongs_to :item
  belongs_to :user
  enum feelings:[:good, :soso, :bad]
end
