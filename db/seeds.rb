# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Loading Lendees"
Lendee.find_or_create_by(name: 'Юр. лицо 1')
Lendee.find_or_create_by(name: 'Юр. лицо 2')
Lendee.find_or_create_by(name: 'Юр. лицо 3')
Lendee.find_or_create_by(name: 'Юр. лицо 4')
