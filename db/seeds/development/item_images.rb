6.upto(13) do |idx|
  ItemImage.create(
    image: "material/items/a00#{idx}.jpg",
    item_id: idx - 5,
  )
end