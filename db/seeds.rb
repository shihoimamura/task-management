# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(
#    email: 'jojo@com',
#    name: 'jojo',
#    password: 'password'
# )
10.times do |n|
   User.create!(
     email: "test3#{n + 1}@test.com",
     name: "テスト太郎#{n + 1}",
     password: "password"
   )
 end

 User.all.each do |user|
   user.tasks.create!(
     title: 'タイトル',
     content: 'テスト',
     enddate: '終了期限',
     status: 'ステータス',
     priority: '高'

   )
 end
