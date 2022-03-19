
# Create sample users for DB
u1 = User.create("email"=>"andy@test.com", "username"=>"andy", "admin"=>false)
u2 = User.create("email"=>"saori@test.com", "username"=>"saori", "admin"=>false)
u3 = User.create("email"=>"bob@test.com", "username"=>"bob", "admin"=>false)
u4 = User.create("email"=>"jay@test.com", "username"=>"jay", "admin"=>false)

# Create sample addresses for DB
a1 = Address.create("street_number"=>1, "street_name"=>"West Street", "suburb"=>"Indooroopilly", "state"=>"QLD", "postcode"=>"4068", "user_id"=>2)
a2 = Address.create("street_number"=>21, "street_name"=>"South Street", "suburb"=>"Fortitude Valley", "state"=>"QLD", "postcode"=>"4000", "user_id"=>3)
a3 = Address.create("street_number"=>31, "street_name"=>"East Street", "suburb"=>"Chelmer", "state"=>"QLD", "postcode"=>"4068", "user_id"=>4)
a4 = Address.create("street_number"=>4, "street_name"=>"2345", "suburb"=>"cbd", "state"=>"234", "postcode"=>"sdfg", "user_id"=>5)


# Create sample games for DB
g1 = Game.create("name"=>"Catan", "genre"=>"family", "minimum_players"=>2, "maximum_players"=>6, "price"=>14.5, "description"=>"Best game for indroducing new players to your gaming group!", "user_id"=>2, "condition"=>nil)
g1.picture.attach(io: File.open(Rails.root.join('app/assets/images/catan.jpg')), filename: 'catan.jpg')

g2 = Game.create("name"=>"Scythe", "genre"=>"worker_placement", "minimum_players"=>1, "maximum_players"=>5, "price"=>32.0, "description"=>"Challenging game in a steam-punk like world of robot war.", "user_id"=>3, "condition"=>nil)
g2.picture.attach(io: File.open(Rails.root.join('app/assets/images/scythe.jpeg')), filename: 'scythe.jpeg')

g3 = Game.create("name"=>"Zombicide", "genre"=>"science_fiction", "minimum_players"=>2, "maximum_players"=>6, "price"=>23.5, "description"=>"Zombies!! What else do you want?\r\n\r\nCan you survive the zombie apocalypse?!", "user_id"=>3, "condition"=>nil)
g3.picture.attach(io: File.open(Rails.root.join('app/assets/images/zombicide.jpeg')), filename: 'zombicide.jpeg')

g4 =  Game.create("name"=>"Rebellion", "genre"=>"strategy", "minimum_players"=>2, "maximum_players"=>4, "price"=>120.0, "description"=>"Missing some cards.\r\n\r\nGreat game set in the Star Wars universe.", "user_id"=>4, "condition"=>nil)
g4.picture.attach(io: File.open(Rails.root.join('app/assets/images/rebellion.jpg')), filename: 'rebellion.jpg')

g5 = Game.create("name"=>"Castle Ravenloft", "genre"=>"fantasy", "minimum_players"=>1, "maximum_players"=>4, "price"=>32.0, "description"=>"Fun co-op D&D game. \r\n\r\nSome damage to the box, and my cat chewed the elf wizard mini.", "user_id"=>4, "condition"=>nil)
g5.picture.attach(io: File.open(Rails.root.join('app/assets/images/ravenloft.jpeg')), filename: 'ravenloft.jpeg')

g6 = Game.create("name"=>"Catan", "genre"=>"family", "minimum_players"=>2, "maximum_players"=>6, "price"=>32.0, "description"=>"Welcome new gamers to your group", "user_id"=>2, "condition"=>nil)
g6.picture.attach(io: File.open(Rails.root.join('app/assets/images/catan.jpg')), filename: 'catan.jpg')

g7 = Game.create("name"=>"Catan", "genre"=>"family", "minimum_players"=>2, "maximum_players"=>6, "price"=>32.0, "description"=>"Classic game", "user_id"=>2, "condition"=>nil)
g7.picture.attach(io: File.open(Rails.root.join('app/assets/images/catan.jpg')), filename: 'catan.jpg')

g8 = Game.create("name"=>"Wrath of Ashardalon", "genre"=>"fantasy", "minimum_players"=>1, "maximum_players"=>4, "price"=>50.0, "description"=>"A great co-op Dungeons and Dragons game.", "user_id"=>2, "condition"=>nil)
g8.picture.attach(io: File.open(Rails.root.join('app/assets/images/ashardalon.jpeg')), filename: 'ashardalon.jpeg')

# Create sample purchases for DB
Purchase.create("price"=>50.0, "deliver"=>false, "game_id"=>1, "user_id"=>4)
Purchase.create("price"=>32.0, "deliver"=>false, "game_id"=>3, "user_id"=>2)
Purchase.create("price"=>32.0, "deliver"=>false, "game_id"=>6, "user_id"=>2)
