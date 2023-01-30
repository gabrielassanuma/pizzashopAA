require 'rails_helper'

RSpec.describe DeliveryFee, type: :model do
  describe 'associations ' do
    it {should have_many (:orders) }
  end

  describe 'associations' do
    it { should have_many(:orders) }
  end
end

