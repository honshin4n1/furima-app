# ----------********カテゴリー第１階層の定義********----------
level_1 = %w(レディース
            メンズ
            ベビー・キッズ
            インテリア・住まい・小物
            本・音楽・ゲーム
            おもちゃ・ホビー・グッズ
            コスメ・香水・美容
            家電・スマホ・カメラ
            スポーツ・レジャー
            ハンドメイド)
level_1.each do |cat|
  Category.create(name: cat)
end
# ----------********カテゴリー第２階層の定義********----------
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
# ーーーーーーーーーーーーーーーーーーーーー
# <インテリア・住まい・小物>
level_2 = %w(キッチン/食器
            ベット/マットレス
            ソファ/ソファベット
            椅子/チェア
            机/テーブル
            収納家具
            ラグ/カーペット/マット
            カーテン/ブラインド
            ライト/照明
            寝具
            インテリア小物
            季節/年中行事)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"インテリア・住まい・小物").children.create(name: cat)
end
# ーーーーーーーーーーーーーーーーーーーーー
# <本・音楽・ゲーム>
level_2 = %w(本
            漫画
            雑誌
            CD
            DVD/ブルーレイ
            レコード
            テレビゲーム)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"本・音楽・ゲーム").children.create(name: cat)
end
# ーーーーーーーーーーーーーーーーーーーーー
# <おもちゃ・ホビー・グッズ>
level_2 = %w(おもちゃ
            タレントグッズ
            コミック/アニメグッズ
            トレーディングカード
            フィギア
            楽器/器材
            コレクション
            ミリタリー
            美術品
            アート用品)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"おもちゃ・ホビー・グッズ").children.create(name: cat)
end
# ーーーーーーーーーーーーーーーーーーーーー
# <コスメ・香水・美容>
level_2 = %w(ベースメイク
            メイクアップ
            ネイルケア
            香水
            スキンケア/基礎化粧品
            ヘアケア
            ボディケア
            オーラルケア
            リラグゼーション
            ダイエット)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"コスメ・香水・美容").children.create(name: cat)
end
# ーーーーーーーーーーーーーーーーーーーーー
# <家電・スマホ・カメラ>
level_2 = %w(スマートフォン/携帯電話
            スマホアクセサリー
            PC/ダブレット
            カメラ
            テレビ/映像機器
            オーディオ機器
            美容/健康
            冷暖房/空調
            生活家電)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"家電・スマホ・カメラ").children.create(name: cat)
end
# ーーーーーーーーーーーーーーーーーーーーー
# <スポーツ・レジャー>
level_2 = %w(ゴルフ
            フィッシング
            自転車
            トレーニング/エクササイズ
            野球
            サッカー/フットサル
            テニス
            スノーボード
            スキー
            その他スポーツ
            アウトドア)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"スポーツ・レジャー").children.create(name: cat)
end
# ーーーーーーーーーーーーーーーーーーーーー
# <ハンドメイド>
level_2 = %w(アクセサリー（女性用）
            ファッション/小物
            アクセサリー/時計
            日用品/インテリア
            趣味/おもちゃ
            キッズ/ベビー
            素材/材料
            二次創作物)
# データを生成
level_2.each do |cat|
  Category.find_by(name:"ハンドメイド").children.create(name: cat)
end