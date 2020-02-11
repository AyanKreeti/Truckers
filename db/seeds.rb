# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
for i in 0..10 do
  Order.create(name: Faker::Name.unique.name, lat: Faker::Number.decimal(l_digits: 2), lng: Faker::Number.decimal(l_digits: 2), status: false)
end