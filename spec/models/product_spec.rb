require 'rails_helper'
require 'byebug'

RSpec.describe Product, type: :model do
  describe "#deactive!" do
    it "should deactive product" do
      product = create(:product)
      product.deactive!
      expect(product.active).to eq(false)
    end
  end

  describe "validations " do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:subclass) }
    it { should validate_presence_of(:active) }
  end
end

