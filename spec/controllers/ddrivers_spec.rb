require 'rails_helper'

RSpec.describe DdriversController, type: :controller do 
  
  describe '#require_admin' do
    context 'when user is admin' do
      it 'allows the action to proceed' do
        sign_in(create(:user, :admin))
        ddriver = create(:ddriver)
        get :show, params: { id: ddriver.id }
        expect(response).to be_successful
      end
    end

    context 'when user is not admin' do
      it 'redirects to the root path' do
        sign_in(create(:user))
        ddriver = create(:ddriver)
        get :show, params: { id: ddriver.id }
        expect(response).to redirect_to(root_path)
      end

      it 'displays a flash message' do
        sign_in(create(:user))
        ddriver = create(:ddriver)
        get :show, params: { id: ddriver.id }
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end
  end


  describe "GET#index" do 
    it "assigns all ddrivers to @ddrivers" do
      sign_in(create(:user, :admin))
      ddriver = create(:ddriver) 
      get :index
      expect(assigns(:ddrivers)).to eq([ddriver])
    end 
  end
  
  describe "GET#show" do
    it "assigns ddriver to @ddriver" do
      sign_in(create(:user, :admin))
      ddriver = create(:ddriver)
      get :show, params: {id: ddriver.id }
      expect(assigns(:ddriver)).to eq(ddriver)
    end
  end

  describe "GET#new" do
    it "assigns a new ddriver to @ddriver" do
      sign_in(create(:user, :admin))
      get :new
      expect(assigns(:ddriver)).to be_a_new(Ddriver)
    end
  end

  describe "GET#edit" do 
    it "assigns the requested ddriver to @ddriver " do 
      sign_in(create(:user, :admin))
      ddriver = create(:ddriver)
      get :edit, params: { id: ddriver.id }
      expect(assigns(:ddriver)).to eq(ddriver)
    end
  end

  describe "POST#create" do 
    context "with valid params" do 
      it "should create a new ddriver" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { ddriver: attributes_for(:ddriver) } }.to change(Ddriver, :count).by(1)
      end
    
      it "should redirects to created ddriver" do 
        sign_in(create(:user, :admin))
        post :create, params: { ddriver: attributes_for(:ddriver) }
        expect(response).to redirect_to(Ddriver.last) 
      end
    end

    context "with invalid params" do
      it "doesn't create a new ddriver on DB" do 
        sign_in(create(:user, :admin))
        expect { post :create, params: { ddriver: attributes_for(:ddriver, :invalid) } }.to_not change(Ddriver, :count)
      end

      it "should redirects to new template" do 
        sign_in(create(:user, :admin))
        post :create, params: { ddriver: attributes_for(:ddriver, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT#update" do
    context "with valid params" do
      it "updates the requested ddriver" do
        sign_in(create(:user, :admin))
        ddriver = create(:ddriver)
        put :update, params: { id: ddriver.id, ddriver: { first_name: "new name" } }
        ddriver.reload
        expect(ddriver.first_name).to eq("new name")
      end

      it "redirects to the updated ddriver" do
        sign_in(create(:user, :admin))
        ddriver = create(:ddriver)
        put :update, params: { id: ddriver.id, ddriver: { first_name: "new name" } }
        expect(response).to redirect_to(ddriver)
      end
    end

    context "with invalid params" do
      it "should redirects to edit template" do 
        sign_in(create(:user, :admin))
        ddriver = create(:ddriver)
        put :update, params: { id: ddriver.id, ddriver: { first_name: ""} }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "PATCH#deactive" do
    it "should change ddriver.active to false" do
      sign_in(create(:user, :admin))
      ddriver = create(:ddriver)
      expect { patch :deactive, params: { id: ddriver.id } }.to change { ddriver.reload.active }.from(true).to(false)
    end
  end
end

