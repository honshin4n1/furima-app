fnames = %w(佐藤 鈴木 高橋 Axelrod Garland)
gnames = %w(太郎 次郎 花子 John Mike)
fnames_kana = %w(サトウ スズキ タカハシ アクセルロッド ガーランド)
gnames_kana = %w(タロウ ジロウ ハナコ ジョン マイク)
phone_numbers = %w(080-1648-9462 080-6382-8423 080-7123-3905 090-5722-8873 080-9226-5462)
0.upto(fnames.length - 1) do |idx|
  SendingDestination.create(
    first_name: gnames[idx],
    family_name: fnames[idx],
    first_name_kana: fnames_kana[idx],
    family_name_kana: gnames_kana[idx],
    post_code: "839-5578",
    prefecture: "熊本県",
    city: "八代市大隈町128-5",
    house_number: "467-58",
    building_name: "アンソレイユ206号室",
    phone_number: phone_numbers[idx],
    user_id: idx + 1
  )
end
