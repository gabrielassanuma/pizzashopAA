require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "#deactive!" do
    it "should deactive product" do
      product = Product.create!(name: "product", description: "description", price: 10, subclass: "test", active: true)
      product.deactive!
      expect(product.active).to eq(false)
    end
  end
end

