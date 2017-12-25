# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Song.destroy_all
Artist.destroy_all
User.destroy_all

user = User.create!(email: "test@test.com", password: "123456")

artists = []
20.times do
  artists << Artist.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      bio: Faker::Hipster.paragraph[0..496] << "...",
  )
end

songs = []
artists.sample(20).each do |artist|
    songs << 10.times do Song.create!(
      title: Faker::Lorem.words(3).join(' '),
      artist: artist,
    )
  end
end
