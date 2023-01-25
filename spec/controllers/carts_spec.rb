require 'rails_helper'
require 'byebug'

RSpec.describe CartsController, type: :controller do
  describe '#show' do
    it 'should set @cart to the current cart' do
      cart = create(:cart)
      allow(controller).to receive(:set_current_cart) { session[:cart_id] = cart.id }
      byebug
      get :show, params: { id: cart.id } 
      expect(assigns(:cart)).to eq(cart)
    end
  end
end