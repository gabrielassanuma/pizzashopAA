require 'rails_helper'
require 'byebug'

RSpec.describe CartsController, type: :controller do
  describe '#show' do
    it 'should set @cart to the current cart' do
      cart = nil
      allow(Cart).to receive(:find_by).and_return(cart)
      controller.send(:set_current_cart)
      expect(:cart).not_to be_nil
    end
  end

  
end