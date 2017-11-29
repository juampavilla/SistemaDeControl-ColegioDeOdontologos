# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "admin@admin.org",
             password:              "admin123",
             password_confirmation: "admin123",
             admin: true)

99.times do |n|

  email = "example-#{n+1}@prueba.org"
  password = "password"
  User.create!(email: email,
               password:              password,
               password_confirmation: password)
end
