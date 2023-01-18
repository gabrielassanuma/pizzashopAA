require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  let(:delivery_fee) {DeliveryFee.create!(zone: "A", price: 2) }
  let(:user) {User.create!(phone_number: 999888777, password: 111111, username: "Gabriel", address: "Calçada da Pampulha 27, Lisboa", latitude: 38.7046306, longitude: -9.167364, delivery_fee: delivery_fee) }
  let(:order) { Order.create!(user: user)}
  let(:product) { Product.create!(name: "Delicious", description: "Super yumi", price: 10, subclass:"test", active: true) }
  let(:cart) { Cart.create! }
  let(:order_product) { OrderProduct.create!(order: order, product: product, quantity: 2, cart: cart) }

  describe "#total_price" do
    it "returns total price for the order product" do
      expect(order_product.total_price).to eq(20)
    end
  end
end