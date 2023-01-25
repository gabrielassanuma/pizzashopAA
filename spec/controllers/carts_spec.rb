require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'GET#show' do
    it 'assigns the current cart to @cart' do
      cart = create(:cart)
      session[:cart_id] = cart.id
      get :show, params: {id: cart.id }
      expect(assigns(:cart)).to eq cart
    end
  end
end 