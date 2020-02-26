# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
lat = 22.572983
lng = 88.433388
for i in 0..10 do
  lat=lat + 0.101110
  lng=lng + 0.101001
  Order.create(name: Faker::Name.unique.name, lat: lat, lng: lng, status: "created", address: Faker::Address.city)
end

for i in 0..3 do
  Trucker.create(name: Faker::Name.unique.name)
end

for i in 1..3 do
  today = Date.today()
  Schedule.create(schedule_name: i.to_s + " on "+ today.to_s, trucker_id: i, delivery_date: today)
end
