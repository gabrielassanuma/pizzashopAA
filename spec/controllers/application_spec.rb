require 'rails_helper'
require 'byebug'

RSpec.describe ApplicationController, type: :controller do
  describe '#set_current_cart' do
    it 'sets the current cart based on the session' do
      cart = create(:cart)
      session[:cart_id] = cart.id
      allow(Cart).to receive(:find_by).and_return(cart)
      controller.send(:set_current_cart)
      expect(assigns(:current_cart)).to eq(cart)
    end

    it 'creates a new cart if one is not found in the session' do
      cart = nil
      session[:cart_id] = nil
      allow(Cart).to receive(:find_by).and_return(cart)
      controller.send(:set_current_cart)
      expect(assigns(:current_cart)).not_to be_nil
    end
  end
end