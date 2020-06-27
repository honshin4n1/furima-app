brands = %w(シャネル ナイキ ルイヴィトン シュプリーム アディダス)
1.upto(brands.length) do |idx|
  Brand.create(
    name: brands[idx],
  )
end