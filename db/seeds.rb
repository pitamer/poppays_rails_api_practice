# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Creator.destroy_all
Gig.destroy_all
GigPayment.destroy_all

gig_payment1 = GigPayment.create(state: 'pending')
gig_payment2 = GigPayment.create(state: 'pending')

gig1 = Gig.create(brand_name: 'SuperBrand', state: 'applied', gig_payment: gig_payment1)
gig2 = Gig.create(brand_name: 'SuperBrand', state: 'applied', gig_payment: gig_payment2)

creator1 = Creator.create(first_name: 'Johnny', last_name: 'Bravo', gigs: [gig1, gig2])
creator2 = Creator.create(first_name: 'Donald', last_name: 'Duck')
