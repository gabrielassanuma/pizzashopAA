require 'rails_helper'

RSpec.describe DdriversController, type: :controller do 
  describe "#index"do
    it "assign all ddrivers to @ddrivers" do
      ddriver = Ddriver.new(first_name: "Elon", last_name: "Musk", active: true) 
      get :index
      expect(assigns(:ddrivers)).to eq([ddriver])
    end 
  end
end