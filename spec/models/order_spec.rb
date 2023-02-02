require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order)}

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
    it { should belong_to(:ddriver).optional }
    it { should belong_to(:delivery_fee).optional }

  end
end


