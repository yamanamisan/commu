# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Member.create!(
  name: 'taro',
  email: "taro@example.com",
  sex: 1,
  department: 1,
  administrator: 1,
  created_at: "2019-07-11 00:00:00",
  updated_at: "2019-07-11 00:00:01",
  password: 'commu!',
  password_confirmation: 'commu!'
)
#seeds/deve...開発  produ...本番 のデータ投下
#table_names = %w(members)
#table_names.each do |table_name|
#  path = Rails.root.join("db/seeds",Rails.env,table_name + ".rb")
#  if File.exist?(path)
#    puts "Creating #{table_name}..."
#    require path
#  end
#end
