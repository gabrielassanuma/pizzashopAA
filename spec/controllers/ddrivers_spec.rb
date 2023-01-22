require 'rails_helper'

RSpec.describe DdriversController, type: :controller do 
  describe "#index" do
    context "assigns all ddrivers to @ddrivers" do 
      it "if user is admin assigns all ddrivers to @ddrivers" do
        sign_in(create(:user, :admin))
        ddriver = create(:ddriver) 
        get :index
        expect(assigns(:ddrivers)).to eq([ddriver])
      end 
    
      it "redirects to root and displays flash message if user is not admin" do 
        sign_in(create(:user))
        ddriver = create(:ddriver)
        get :index
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end
  end
  
  describe "#show" do
    context "assigns ddriver to @ddriver" do 
      it "if user is admin assigns ddriver to @ddriver" do
        sign_in(create(:user, :admin))
        ddriver = create(:ddriver)
        get :show, params: {id: ddriver.id }
        expect(assigns(:ddriver)).to eq(ddriver)
      end

      it "redirects to root and displays flash message if user is not admin" do 
        sign_in(create(:user))
        ddriver = create(:ddriver)
        get :index
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end 
  end

  describe '#new' do
    context "assigns a new ddriver to @ddriver" do 
      it 'if user is admin assigns a new ddriver to @ddriver' do
        sign_in(create(:user, :admin))
        get :new
        expect(assigns(:ddriver)).to be_a_new(Ddriver)
      end

      it "redirects to root and displays flash message if user is not admin" do
        sign_in(create(:user))
        get :new
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end 
    end
  end

  describe '#edit' do 
    context "assigns the requested ddriver to @ddriver" do 
      it "if user is admin assigns the requested ddriver to @ddriver " do 
        sign_in(create(:user, :admin))
        ddriver = create(:ddriver)
        get :edit, params: { id: ddriver.id }
        expect(assigns(:ddriver)).to eq(ddriver)
      end

      it "redirects to root and displays flash message if user is not admin" do
        sign_in(create(:user))
        ddriver = create(:ddriver)
        get :edit, params: { id: ddriver.id }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
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

      it "should redirects to new template" do 
        sign_in(create(:user))
        post :create, params: { ddriver: attributes_for(:ddriver, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end


end