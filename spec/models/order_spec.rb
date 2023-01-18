require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) {User.create!(phone_number: 999888777, password: 111111, username: "Gabriel", address: "Calçada da Pampulha 27, Lisboa", latitude: 38.7046306, longitude: -9.167364) }
  let(:ddriver) { Ddriver.create!(first_name: "Elon", last_name: "Musk", active: true) }
  let(:delivery_fee) { DeliveryFee.create!(zone: "A", price: 2) }
  let(:order) { Order.create!(user: user, total_price: 100, order_status: 'new_order', ddriver: ddriver, take_away_name: '', take_away_phone: '', delivery_fee: "delivery_fee" ) }


  describe '#ready!' do 
    it "should mark order as ready" do
      order.ready!
      expect(order.order_status).to eq('')
    end
  end
end
