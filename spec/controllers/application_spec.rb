require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "#set_current_cart" do
    it "assigns @current_cart" do
      sign_in(create(:user))
      cart = create(:cart)
      session[:cart_id] = cart.id
      expect(assigns(:current_cart)).to eq(cart)
    end
  end
end