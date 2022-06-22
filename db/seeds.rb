puts "🌱 Seeding data..."

10.times do
  host = Host.create(username: Faker::Internet.username)
  rand(1..7).times do
    #create instances of Vehicle belonging to Host
    make = Faker::Vehicle.make
    Vehicle.create(
      image_url: 'https://static.cargurus.com/images/site/2009/04/09/12/32/1995_buick_lesabre_custom-pic-21135-640x480.jpeg',
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
  guest = Guest.create(username: Faker::Internet.username)
  vehicle_ids = Vehicle.all.ids
  rand(0..1).times do
    start_date = Faker::Date.forward(days: 30)
    end_date = Faker::Date.between(from: start_date, to: Faker::Date.forward(days: 40))
    Reservation.create(
      guest_id: guest.id,
      vehicle_id: vehicle_ids.sample,
      start_date: start_date,
      end_date: end_date
    )
  end
end

puts "✅ Done seeding!"
