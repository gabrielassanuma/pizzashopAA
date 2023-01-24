require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  let(:order_product) { create(:order_product )}

  describe "#total_price" do
    it "returns total price for the order product" do
      expect(order_product.total_price).to eq(10)
    end
  end

  describe 'associations' do
    it { should belong_to(:order).optional }
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end

  def optional(optional = true)
    remove_submatcher(AssociationMatchers::RequiredMatcher)
    add_submatcher(
      AssociationMatchers::OptionalMatcher,
      name,
      optional,
    )
    self
  end
end

