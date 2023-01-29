require 'rails_helper'
require 'byebug'

RSpec.describe CartsController, type: :controller do
  describe '#show' do
    it 'should set @cart to the current cart' do
      cart = create(:cart)
      allow(controller).to receive(:set_current_cart).and_return(cart)
      get :show, params: { id: set_current_cart.id } 
      expect(assigns(:cart)).to eq(set_current_cart)
    end
  end
end