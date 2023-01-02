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

puts "Creating admin"
admin = User.new(email: "admin@pizza.shop", password: 111111, password_confirmation: 111111, username:"admin", phone_number: "000000000", street_name: "NOT APPLICABLE", house_number: "NOT APPLICABLE", admin: true)
admin.save!
puts "Admin created"

puts "Creating users"
10.times do
  password = "111111"
  user = User.new(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    username: Faker::Name.name_with_middle,
    phone_number: Faker::Number.number(digits: 9),
    street_name: Faker::Address.street_name,
    house_number: rand(1..1000)
  )
  user.save!
end
puts "Users created"

puts "Creating Products"

pizzas = ["Peperoni", "Cheese", "Extra Cheese", "Hawaiian", "Supreme", "Veggie", "Spicy", "Special", "Portuguese", "Meat Lovers", "Piri Piri Chicken", "Mushroon and Olives"]
drinks = ["Coca-cola", "Sprite", "Water", "Iced Tea"]
desserts = ["Ice Cream", "Cheese Cake", "Chocolate Mousse", "Carrot Cake"]
12.times do |index|
  product = Product.new(
    name: pizzas[index],
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(10..14),
    subclass: "pizza"
  )
  product.save!
end
4.times do |index|
  product = Product.new(
    name: drinks[index],
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(2..3),
    subclass: "drink"
  )
  product.save!
end
4.times do |index|
  product = Product.new(
    name: desserts[index],
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(3..5),
    subclass: "dessert"
  )
  product.save!
end
puts "Products created"
