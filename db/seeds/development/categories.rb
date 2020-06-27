# ********カテゴリー第１階層の定義*******
level_1 = %w(レディース
            メンズ
            ベビー・キッズ
            インテリア・住まい・小物
            本・音楽・ゲーム)
level_1.each do |cat|
  Category.create(name: cat)
end
# ********カテゴリー第２階層の定義******
# <レディース>
level_2 = %w(トップス
            ジャケット/アウター
            パンツ
            スカート
            ワンピース
            靴
            ルームウェア/パジャマ
            レッグウェア
            帽子
            バッグ
            アクセサリー
            ヘアアクセサリー
            小物
            時計)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"レディース").children.create(name: cat)
end
# ーーーーーーーーーーーーーーーーーーーーー
# <メンズ>
level_2 = %w(トップス
            ジャケット/アウター
            パンツ
            靴
            バック
            スーツ
            帽子
            アクセサリー
            水着
            レッグウェア
            アンダーウェア
            帽子
            バッグ
            アクセサリー
            小物
            時計)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"メンズ").children.create(name: cat)
end
# ーーーーーーーーーーーーーーーーーーーーー
# <ベビー・キッズ>
level_2 = %w(ベビー服（女の子用）〜95cm
            ベビー服（男の子用）〜95cm
            ベビー服（男女兼用）〜95cm
            ベビー服（女の子用）〜100cm
            ベビー服（男の子用）〜100cm
            ベビー服（男女兼用）〜100cm
            キッズ靴
            子供用ファッション小物
            おむつ/トイレ/バス
            外出/移動用品
            授乳/食事
            ベビー家具/寝具/室内用品
            おもちゃ
            行事/記念品)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"ベビー・キッズ").children.create(name: cat)
end