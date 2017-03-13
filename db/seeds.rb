# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dev_blizzard = Developer.create(name: 'Blizzard')

action = Genre.create(name: 'Action')
adventure = Genre.create(name: 'Adventure')
strategy = Genre.create(name: 'Strategy')

Game.create(title: 'The Last of Us')
Game.create(title: 'Paladins: Champions of the Realm') do |game|
  game.genres << action
end
Game.create(title: 'Legend of Zelda: Breath of the Wild') do |game|
  game.genres << [action, adventure, strategy]
end
Game.create(title: 'Hearthstone', developer: dev_blizzard)
Game.create(title: 'Overwatch', developer: dev_blizzard)
Game.create(title: 'Diablo 3', developer: dev_blizzard)
