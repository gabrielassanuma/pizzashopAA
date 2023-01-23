require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) {User.create!(phone_number: 999888777, password: 111111, username: "Gabriel", address: "Calçada da Pampulha 27, Lisboa", latitude: 38.7046306, longitude: -9.167364) }
  let(:delivery_fee) {DeliveryFee.create!(zone: "A", price: 2) }
  let(:ddriver) { Ddriver.create!(first_name: "Elon", last_name: "Musk", active: true) }
  let(:order) { Order.create!(user: user, total_price: 100, order_status: 'new_order', delivery_fee: delivery_fee, ddriver: ddriver ) }

  describe '#ready!' do 
    it "should mark order as ready" do
      order.ready!
      expect(order.order_status).to eq('ready')
    end
  end

  describe '#finalize!' do
    it "should mark order as finalized" do 
      order.finalize!
      expect(order.order_status).to eq('finalized')
    end
  end

  describe '#accept!' do
    it "should mark order as accepted" do
      order.accept!
      expect(order.order_status).to eq('accepted')
    end
  end

  describe 'associations' do 
    it { should belong_to(:user) }
    it { should have_many(:order_products) }
    it { should belong_to(:ddriver) }
    it { should belong_to(:delivery_fee) }

  end
end


