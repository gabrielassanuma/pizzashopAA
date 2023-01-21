require 'rails_helper'

RSpec.describe DdriversController, type: :controller do 
  describe "#index"do
    it "assign all ddrivers to @ddrivers" do
      sign_in(create(:user))
      ddriver = create(:ddriver) 
      get :index
      expect(assigns(:ddrivers)).to eq([ddriver])
    end 
  end
end