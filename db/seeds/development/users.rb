nicknames = %w(Taro Jiro Hana John Mike)
1.upto(nicknames.length) do |idx|
  User.create(
    nickname: nicknames[idx],
    email: "#{nicknames[idx]}@gmail.com",
    password: "12345678"
  )
end