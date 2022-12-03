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
products = ["Peperoni", "Cheese", "Extra Cheese", "Hawaiian", "Supreme", "Veggie", "Spicy", "Special",
            "Coca-cola", "Sprite", "Water", "Iced Tea",
            "Ice Cream", "Cheese Cake", "Mousse"]
15.times do |index|
  product = Product.new(
    product_name: products[index],
    product_description: Faker::Lorem.sentence(word_count: 10),
    price: rand(1..8)
  )
  product.save!
end
puts "Products created"
