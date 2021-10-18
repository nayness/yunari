# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  race = Race.new(name: Faker::Games::WorldOfWarcraft.race)
  race.save if race.valid?
end
20.times do
  kind = Kind.new(name: Faker::Games::WorldOfWarcraft.class_name)
  kind.save if kind.valid?
end
Role.find_or_create_by(name: :standard)
Role.find_or_create_by(name: :admin)