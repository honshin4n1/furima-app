FactoryBot.define do
  factory :item do
    name                  {"ナイキのシューズ"}
    introduction          {"エアマックス95 イエロー"}
    price                 {"50000"}
    size                  {"27.5"}
    condition_id          {"1"}
    buyer                 {""}
    prefecture_id         {"40"}
    preparation_day_id    {"2"}
    postage_payer_id      {"1"}
    user
    category
    brand
  end
end
