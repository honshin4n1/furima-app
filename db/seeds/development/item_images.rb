6.upto(10) do |idx|
  ItemImage.create(
    image: "a00#{+ idx}",
    item_id: idx - 5,
  )
end