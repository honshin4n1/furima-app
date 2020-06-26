brands = %w(シャネル ナイキ ルイヴィトン シュプリーム アディダス)
0.upto(4) do |idx|
  Brand.create(
    name: brands[idx],
  )
end