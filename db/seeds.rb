# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

wasabi = Restaurant.create(name: 'Wasabi')
wasabi.reviews.create(rating:1, review: 'bad')
wasabi.reviews.create(rating:3, review: 'good')
wasabi.reviews.create(rating:4, review: 'ok')
wasabi.reviews.create(rating:2, review: 'poor')
wasabi.reviews.create(rating:5, review: 'great')

kfc = Restaurant.create(name: 'KFC')
kfc.reviews.create(rating:2, review: 'Really poor')
kfc.reviews.create(rating:4, review: 'Really good')
kfc.reviews.create(rating:5, review: 'Really Great')
kfc.reviews.create(rating:1, review: 'Really bad')
kfc.reviews.create(rating:3, review: 'Really OK')

nandos = Restaurant.create(name: 'Nandos')
nandos.reviews.create(rating:1, review: 'Really bad')
nandos.reviews.create(rating:5, review: 'Really Great')
nandos.reviews.create(rating:3, review: 'Really OK')
nandos.reviews.create(rating:4, review: 'Really good')
nandos.reviews.create(rating:2, review: 'Really poor')