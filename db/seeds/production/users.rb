nicknames = %w(Taro Jiro Hana John Mike)
0.upto(nicknames.length - 1) do |idx|
  User.create(
    nickname: nicknames[idx],
    email: "#{nicknames[idx]}@gmail.com",
    password: "12345678"
  )
end