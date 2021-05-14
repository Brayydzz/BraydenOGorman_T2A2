# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


accessories = ItemType.create(name: "Accessories")
bags = ItemType.create(name: "Bags")
balls = ItemType.create(name: "Balls")
sets = ItemType.create(name: "Full Sets")
iron_sets = ItemType.create(name: "Iron Sets")
irons_single = ItemType.create(name: "Irons")
wedges = ItemType.create(name: "Wedges")
drivers = ItemType.create(name: "Drivers")
fairway_wood = ItemType.create(name: "Fairway Woods")
hybrids = ItemType.create(name: "Hybrids")
left_handed = ItemType.create(name: "Left Handed Clubs")
putters = ItemType.create(name: "Putters")
juniors = ItemType.create(name: "Junior")
shoes = ItemType.create(name: "Shoes")

cond_used = Condition.create(name: 'Used')
cond_new = Condition.create(name: "New")

fake_address = Address.create(unit_num: " ", street_num: "123", street: "Fake Street", suburb: "Springfield", postcode: "0001")