FactoryBot.define do
  factory :item_image do
    image {File.open("#{Rails.root}/public/uploads/item_image/a001.jpg")}
  end
end
