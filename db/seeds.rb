puts "🌱 Seeding data..."

10.times do
  host = Host.create(username: Faker::Internet.username)
  rand(1..7).times do
    #create instances of Vehicle belonging to Host
    make = Faker::Vehicle.make
    Vehicle.create(
      make: make,
      model: Faker::Vehicle.model(make_of_model: make),
      year: Faker::Vehicle.year,
      price_per_day: rand(25..100),
      description: Faker::Lorem.paragraph,
      host_id: host.id
    )
  end
end

25.times do
  Guest.create(username: Faker::Internet.username)
end

puts "✅ Done seeding!"
