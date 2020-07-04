FactoryBot.define do
  factory :sending_destination do
    first_name          {"花子"}
    family_name         {"鈴木"}
    first_name_kana     {"ハナコ"}
    family_name_kana    {"スズキ"}
    post_code           {"810-0000"}
    prefecture          {"福岡県"}
    city                {"福岡市中央区"}
    house_number        {"中洲1-1-1"}
    building_name       {"ビル8F"}
    phone_number        {"09000009999"}
    association :user
  end
end
