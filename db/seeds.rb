# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
require 'bcrypt'
300.times do
  Invoice.create(amount: Faker::Number.decimal(2), customer: Faker::Name.name, delivery_date: Faker::Date.between(Date.today - 5.days, 1.month.from_now), delivered: false, address: Faker::Address.street_address)
end
