## ATTENTION! BEFORE RUN SEED go to delivery_fee model and comment belongs_ to :user

require 'faker'

puts "Dropping data base..."
DeliveryFee.destroy_all
User.destroy_all
Order.destroy_all
OrderProduct.destroy_all
Product.destroy_all
Ddriver.destroy_all
puts "Data base destroyed!"

puts "Creating delivery_fees - waiting for 4"
delivery_prices = [1, 1.5, 2, 3]
zones = ["A", "B", "C", "D"]
4.times do | index |
  deliveryfee = DeliveryFee.new(
    price: delivery_prices[index],
    zone: zones[index]
  )
  deliveryfee.save
  puts "  delivery_fee #{index} created"
end
puts "Delivery fees created"

puts "Creating admin - waiting for 1"
admin = User.new(email: "admin@pizza.shop", password: 111111, password_confirmation: 111111, username:"admin", phone_number: "000000000", address: "Praça Marquês De Pombal 3, 1250-098 Lisbon", admin: true, delivery_fee_id: "")
admin.save!
puts "Admin created"

puts "Creating users - waiting for 10"

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
  puts "  user #{index} created"
end
puts "Users created"

puts "Creating Products - waiting for 20"
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
  puts "   product #{index} created"
end
4.times do |index|
  product = Product.new(
    name: drinks[index],
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(2..3),
    subclass: "drink"
  )
  product.save
  puts "   product #{index + 12} created"
end
4.times do |index|
  product = Product.new(
    name: desserts[index],
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(2..3),
    subclass: "dessert"
  )
  product.save
  puts "   product #{index + 16} created"
end
puts "Products created"

puts "Creating Ddrivers - waiting for 4"
4.times do |index|
  ddriver = Ddriver.new(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name
  )
  ddriver.save
  puts "  ddriver #{index} created"
end
puts "Ddrivers created"
