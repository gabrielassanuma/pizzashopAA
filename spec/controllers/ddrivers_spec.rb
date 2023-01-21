require 'rails_helper'

RSpec.describe DdriversController, type: :controller do 
  describe "#index" do
    it "assign all ddrivers to @ddrivers" do
      sign_in(create(:user))
      ddriver = create(:ddriver) 
      get :index
      expect(assigns(:ddrivers)).to eq([ddriver])
    end 
  end

  describe "#show" do
    it "assigns ddriver to @ddriver" do
      sign_in(create(:user))
      ddriver = create(:ddriver)
      get :show, params: {id: ddriver.id}
      expect(assigns(:ddriver)).to eq(ddriver)
    end
  end 

  describe '#new' do
    it 'assigns a new ddriver to @ddriver' do
      sign_in(create(:user))
      get :new
      expect(assigns(:ddriver)).to be_a_new(Ddriver)
    end
  end

end