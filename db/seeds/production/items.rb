names = %w(ハトムギ化粧水 ipohne10 Echo_Dot 長財布 ワンピース カードヒーロー システム設計の原則 ダークチョコレート)
introductions = %w(※製造終了品につき品薄となっていますので、お早めにどうぞ。こちらの商品お値下げ不可です。<<<商品説明>>>保湿力に優れた12種類の美容成分をふんだんに配合したとろみのある液が、角質層の奥深くまで、しっかりとうるおいを届けます。エクトイン・ヒアルロン酸Na・アルギニン・クレアチンなど配合。無香料・ノンアルコール
                  感動した
                  今が買い時
                  経年劣化により味が出てます
                  一部滲みがございます
                  懐かしのあのゲーム
                  変更を楽で安全にするオブジェクト指向の実践技法
                  騙されたと思って食べてみて)
prices = %w(1000 98000 32000 40000 4000 1200 3000 2900)

0.upto(names.length - 1) do |idx|
  Item.create!({
    name: names[idx],
    introduction: introductions[idx],
    price: prices[idx],
    size:"43 mm x 99 mm x 99 mm",
    condition: "新品同様",
    deal_state: false,
    user_id:rand(1..5),
    brand_id:rand(1..5),
    category_id:rand(11..90),
    prefecture_id: rand(1..47),
    preparation_day_id: rand(1..3),
    postage_payer_id: rand(1..2),
    item_images_attributes: [
      {
        image: File.open("#{Rails.root}/public/uploads/item_image/a00#{idx + 1}.jpg")),
        item_id: idx + 1
      }
    ]
  })
end

