names = %w(ハトムギ化粧水 ipohne10 Echo_Dot 長財布 ワンピース カードヒーロー システム設計の原則 ダークチョコレート)
introductions = %w(めっちゃいい
                  感動した
                  今が買い時
                  経年劣化により味が出てます
                  一部滲みがございます
                  懐かしのあのゲーム
                  変更を楽で安全にするオブジェクト指向の実践技法
                  騙されたと思って食べてみて)
prices = %w(1000 98000 32000 40000 4000 1200 3000 2900)

0.upto(names.length - 1) do |idx|
  Item.create(
    name: names[idx],
    introduction: introductions[idx],
    price: prices[idx],
    size:"43 mm x 99 mm x 99 mm",
    condition: "新品同様",
    deal_state: false,
    user_id:rand(1..5),
    brand_id:rand(1..5),
    category_id:rand(10..90),
    prefecture_id: rand(1..47),
    preparation_day_id: rand(1..3),
    postage_payer_id: rand(1..2)
  )
end


