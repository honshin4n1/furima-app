FactoryBot.define do
  factory :item_image do
    image {File.open("#{Rails.root}/public/images/test_image1.jpg")}
  end
end
