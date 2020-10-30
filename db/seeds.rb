# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities=[]
users=[]
gossips=[]

require 'faker'

10.times do
  city = City.create!(name: Faker::Address.city)
  cities << city
end

10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count:5, supplemental: false, random_words_to_add: 5), email: Faker::Internet.email, age: rand(7..99), city: cities.sample)
  users << user
end

20.times do
  gossip = Gossip.create!(title: Faker::Lorem.word, content: Faker::Lorem.sentence(word_count:10, supplemental: true, random_words_to_add: 5), user: users.sample)
  gossips << gossip
end