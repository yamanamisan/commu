names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
0.upto(9) do |idx|
  Member.create(
    name: names[idx],
    email: "#{names[idx]}@example.com",
    sex: [1, 1, 2][idx % 3],
    department: 1,
    administrator: (idx == 0),
    created_at: "2019-07-11 00:00:00",
    updated_at: "2019-07-11 00:00:01",
    password: 'commu!',
    password_confirmation: 'commu!'
  )
end

0.upto(29) do |idx|
  Member.create(
    name: "John#{idx + 1}",
    email: "John#{idx+1}@example.com",
    sex: 1,
    department: 1,
    administrator: false,
    password: "password",
    password_confirmation: "password"
  )
end
