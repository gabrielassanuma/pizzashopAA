require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.create! }
  let(:product1) { Product.create!(name: "Product 1", price: 10.00) }
  let(:product2) { Product.create!(name: "Product 2", price: 20.00) }
  let(:order_product1) { OrderProduct.create!(product: product1, cart: cart, quantity: 2) }
  let(:order_product2) { OrderProduct.create!(product: product2, cart: cart, quantity: 3) }

  before do
    order_product1
    order_product2
  end

  describe "#sub_total" do
    it "returns the correct subtotal for the cart" do
      expect(cart.sub_total).to eq(80.00)
    end
  end

  describe "associations" do
    it { should have_many(:order_products) }
    it { should have_many(:products) }
  end
end

