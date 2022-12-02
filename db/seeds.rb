# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Dropping data base..."
User.destroy_all
Order.destroy_all
OrderProduct.destroy_all
Product.destroy_all
puts "Data base destroyed!"

puts "Creating users"
20.times do
  password = "111111"
  user = User.new(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    name: Faker::Name.name_with_middle,
    phone_number: Faker::Number.number(digits: 9),
    street_name: Faker::Address.street_name,
    house_number: rand(1..1000)
  )
  user.save!
end
puts "Users created"

puts "Creating Products"
pizzas_flavour = ["Peperoni", "Veggie", "Supreme", "Supreme Plus", "Hawaiian", "Spicy", "Sausage",
"Bacon", "Extra Cheese", ]
