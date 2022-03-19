# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Address.destroy_all
Game.destroy_all
Purchase.destroy_all
puts 'Cleaning database...'
puts 'Database ready for seeding...'
puts 'Seeding database'

u1 = User.create(username: 'admin', email:'admin@test.com', password: '123456', password_confirmation: '123456', admin: true)
u2 = User.create(username: 'andy', email:'andy@test.com', password: '123456', password_confirmation: '123456', admin: false)
u3 = User.create(username: 'jane', email:'saori@test.com', password: '123456', password_confirmation: '123456', admin: false)
u4 = User.create(username: 'saori', email:'jane@test.com', password: '123456', password_confirmation: '123456', admin: false)

a1 = Address.create(user: u1, street_number: 116, street_name: 'Adelaide Street', suburb: 'CBD', state: 'QLD', postcode: '4000')
a2 = Address.create(user: u2, street_number: 4, street_name: 'West Street', suburb: 'Fortitude Valley', state: 'QLD', postcode: '4000')
a3 = Address.create(user: u3, street_number: 12, street_name: 'Riverview Terrace', suburb: 'Indooroopilly', state: 'QLD', postcode: '4068')
a4 = Address.create(user: u4, street_number: 25, street_name: 'Moggil Road', suburb: 'Taringa', state: 'QLD', postcode: '4067')

g1 = Game.create(name: 'Catan', genre: 3, minimum_players: 1, maximum_players: 6, price: 24.50, description: 'A great game for the family and new players')
g2 = Game.create(name: 'Scythe', genre: 6, minimum_players: 2, maximum_players: 4, price: 125.50, description: 'Gather resources and build steam-punk robots to fight for victory in an alternate history universe')
g3 = Game.create(name: 'Pandemic', genre: 6, minimum_players: 2, maximum_players: 4, price: 70.00, description: 'Save the world from Cuthulu and cultists in this Cuthulu version of Pandemic')
g4 = Game.create(name: 'Elder Sign', genre: 7, minimum_players: 1, maximum_players: 8, price: 48.50, description: 'A fun and very challenging game of luck and dice rolls!')
g5 = Game.create(name: 'Arkham Horror Card Game', genre: 2, minimum_players: 1, maximum_players: 2, price: 80.00, description: 'A great game for two players. Lots of story and suspense.')
g6 = Game.create(name: 'Illuminati', genre: 3, minimum_players: 2, maximum_players: 6, price: 56.50, description: 'Funny game of world domination and broken deals!')
g7 = Game.create(name: 'Mountains of Madness', genre: 1, minimum_players: 3, maximum_players: 5, price: 32.90, description: 'Engaging favourite of many gaming groups')
g8 = Game.create(name: 'Tokaido', genre: 3, minimum_players: 2, maximum_players: 5, price: 52.00, description: 'Beautiful game set in Anciant Japan. Become a tourist travelling between Kyoto and Edo!')
g9 = Game.create(name: 'Carcassonne', genre: 6, minimum_players: 2, maximum_players: 5, price: 14.50, description: 'A classic everyone loves and needs!')
g10 = Game.create(name: 'Star Wars Outer Rim', genre: 1, minimum_players: 1, maximum_players: 4, price: 100.00, description: 'Conquer the galaxy as the Empire or the Rebels!')
g11 = Game.create(name: 'Descent', genre: 2, minimum_players: 2, maximum_players: 5, price: 250.50, description: 'Complete game with all expansions included!')


# p1 = Perform.create(movie: m1, actor: a1, role: 'Maverick')

puts 'Database is ready'