require 'rails_helper'
require 'byebug'

RSpec.describe CartsController, type: :controller do
  describe '#show' do
    it 'should set @cart to the current cart' do
      current_cart = create(:cart)
      allow(controller).to receive(:current_cart)
      get :show, params: { id: cart.id } 
      expect(assigns(:cart)).to eq(cart)
    end
  end
end