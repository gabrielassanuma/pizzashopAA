require 'rails_helper'

RSpec.describe DdriversController, type: :controller do 
  describe "#index" do
    it "assigns all ddrivers to @ddrivers" do
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
      get :show, params: {id: ddriver.id }
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

  describe '#edit' do 
    it "assigns the requested ddriver to @ddriver" do 
      sign_in(create(:user))
      ddriver = create(:ddriver)
      get :edit, params: { id: ddriver.id }
      expect(assigns(:ddriver)).to eq(ddriver)
    end
  end

  describe '#create' do 
    context "with valid params" do 
      it "creates a new ddriver on DB" do
        sign_in(create(:user))
        expect { post :create, params: { ddriver: attributes_for(:ddriver) } }.to change(Ddriver, :count).by(1)
      end
    
      it "should redirects to created ddriver" do 
        sign_in(create(:user))
        post :create, params: { ddriver: attributes_for(:ddriver) }
        expect(response).to redirect_to(Ddriver.last) 
      end
    end

    context "with invalid params" do
      it "doesn't create a new ddriver on DB" do 
        sign_in(create(:user))
        expect { post :create, params: { ddriver: attributes_for(:ddriver, :invalid) } }.to_not change(Ddriver, :count)
      end
    end
  end

end