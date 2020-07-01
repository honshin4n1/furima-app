brands = %w(シャネル ナイキ ルイヴィトン シュプリーム アディダス)
0.upto(brands.length - 1) do |idx|
  Brand.create(name: brands[idx])
end