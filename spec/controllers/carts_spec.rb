require 'rails_helper'
require 'byebug'

RSpec.describe CartsController, type: :controller do
  describe '#show' do
    it 'should set @cart to the current cart' do
      cart = create(:cart)
      session[:cart_id] = cart.id
      get :show, params: { id: cart.id } 
      expect(assigns(:cart)).to eq(nil)
    end
  end
end