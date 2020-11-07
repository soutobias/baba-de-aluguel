# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

# c = 0
# 100.times do
#   open("https://kitt.lewagon.com/placeholder/users/random") do |image|
#     File.open("./#{c}.jpg", "wb") do |file|
#       file.write(image.read)
#     end
#   end
#   c += 1
# end

Babysitter.destroy_all
User.destroy_all
Review.destroy_all

c = 1
3.times do
  puts c
  file = URI.open('https://kitt.lewagon.com/placeholder/users/random')
  u = User.new(
    email: "#{c}@gmail.com",
    name: Faker::Name.name,
    password: '123abc',
    location: ["Copacabana", "Ipanema", "Leblon, Rio de Janeiro", "Uruguaiana", "Santa Cruz, Rio de Janeiro", "Barra da Tijuca, Rio de Janeiro"].sample,
    phone: Faker::PhoneNumber.phone_number
  )
  u.photo.attach(io: file, filename: "#{c}.jpg", content_type: 'image/jpg')
  puts c
  u.save!
  puts c
  b = Babysitter.create(
    experience: (0..10).to_a.sample,
    price: (20..100).to_a.sample,
    skill: ["cozinhar", "limpar", "ensinar", "brincar"].sample,
    user_id: User.maximum('id')
  )

  5.times do
    r = Review.create(
      rating: (1..5).to_a.sample,
      description: Faker::TvShows::BigBangTheory,
      babysitters_id: Babysitter.maximum('id'),
      user_id: User.maximum('id')
    )
  end
  c += 1
end
