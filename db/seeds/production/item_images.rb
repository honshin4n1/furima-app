# 6.upto(13) do |idx|
#   ItemImage.create(
#     image: "material/items/a00#{idx}.jpg",
#     item_id: idx - 5
#   )
#   #ハトムギ化粧水の画像を追加
#   if idx == 6 then
#     ItemImage.create(image: "material/items/a00#{idx}-1.jpg", item_id: 1)
#     ItemImage.create(image: "material/items/a00#{idx}-2.jpg", item_id: 1)
#   end
# end