# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'bcrypt'
User.create(name: 'Josh', email: 'josh@email.com', password: BCrypt::Password.create("josh"), password_confirmation: "josh")

Invoice.create(product: "10KG Steve's Coffee Beans", amount: 89.95, card_type: "Visa", card_number:"4321 4321 4321 4321", user:User.find_by_name("Josh"), signature: "data:image/png;base64,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")

