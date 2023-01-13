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
Ddriver.destroy_all
puts "Data base destroyed!"

puts "Creating admin"
admin = User.new(email: "admin@pizza.shop", password: 111111, password_confirmation: 111111, username:"admin", phone_number: "000000000", address: "NOT APPLICABLE", admin: true)
admin.save
puts "Admin created"

puts "Creating users"

addresses = ['Rua Rodrigues de Faria 63, Lisboa',
  'Rua do Ginjal 69, Almada',
  'Calçada da Pampulha 27, Lisboa',
  'Rua das Portas de Santo Antão 150, Lisboa',
  'Rua Bulhão Pato 2, Lisboa',
  'Avenida Almirante Reis 1, Lisboa',
  'Praça dos Restauradores 79, Lisboa',
  'Rua Gilberto Rola 20, Lisboa',
  'Rua do Loreto 2, Lisboa',
  'Largo Santos 5, Lisboa']

10.times do | index |
  password = "111111"
  user = User.new(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    username: Faker::Name.name_with_middle,
    phone_number: Faker::Number.number(digits: 9),
    address: addresses[index]
  )
  user.save
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
  product.save
end
4.times do |index|
  product = Product.new(
    name: drinks[index],
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(2..3),
    subclass: "drink"
  )
  product.save
end
4.times do |index|
  product = Product.new(
    name: desserts[index],
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(2..3),
    subclass: "dessert"
  )
  product.save
end
puts "Products created"


4.times do |index|
  ddriver = Ddriver.new(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name
  )
  ddriver.save
end
puts "Ddrivers created"

delivery_prices = [1, 1.5, 2, 3]
zones = ["A", "B", "C", "D"]
4.times do | index |
  delivery_fee = DeliveryFee.new(
    price: delivery_prices[index],
    zone: zones[index]
  )
  delivery_fee.save
end
puts "Delivery fees created"