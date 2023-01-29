require 'rails_helper'
require 'byebug'

RSpec.describe CartsController, type: :controller do
  describe '#show' do
    it 'should set @cart to the current cart' do
      controller.send(:set_current_cart)
      expect(:cart).not_to be_nil
    end
  end

  describe "#destroy" do
    it "should destroy cart and dependencies order_products" do
      sign_in(create(:user))
      order_product = create(:order_product)
      delete :destroy, params: { id: order_product.cart_id }
      expect(response).to redirect_to(root_path)
    end
  end
end