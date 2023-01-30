require 'rails_helper'

RSpec.describe DeliveryFee, type: :model do
  describe 'associations ' do
    it {should have_many (:orders) }
  end

  describe 'associations' do
    it { should have_many(:orders) }
    it { should validate_presence_of(:zone) }
    it { should validate_presence_of(:price) }
  end
end

