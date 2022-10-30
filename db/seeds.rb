10.times do
  User.create(
    name: Faker::Name.name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )

  Trip.create(
    create_by: Faker::Name.name,
    trip_date: Faker::Date.in_date_period,
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),    
    
    # Was getting an error here and with shares: ActiveModel::RangeError: 6299219391 is out of range for ActiveModel::Type::Integer with limit 4 bytes
    # Had to limit number of digits 
    upvotes: Faker::Number.number(digits: 3),
    shares: Faker::Number.number(digits: 5),
    public: Faker::Boolean.boolean
  )

  Location.create(
    name: Faker::Address.street_address,
    address: Faker::Address.full_address,
    contact: Faker::PhoneNumber.phone_number,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    
    # Was getting an error here: ActiveModel::RangeError: 6299219391 is out of range for ActiveModel::Type::Integer with limit 4 bytes
    # Had to limit number of digits 
    price: Faker::Number.number(digits: 4),
    image: Faker::String.random(length: 4),
    open_times: Faker::Lorem.sentence(word_count: 2)
  )

  10.times do
    StarFan.create(star: User.all.sample, fan: User.all.sample)
  end

  10.times do
    TripLocation.create(trip: Trip.all.sample, location: Location.all.sample)
  end

  10.times do
    TripUser.create(trip: Trip.all.sample, user: User.all.sample)
  end
  
end