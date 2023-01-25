require 'rails_helper'
require 'byebug'

RSpec.describe OrdersController, type: :controller do

  describe "GET#index" do
    context "assigns all orders to @orders" do
      it "if user is admin assigns all orders to @orders" do
        sign_in(create(:user, :admin))
        order = create(:order)
        get :index
        expect(assigns(:orders)).to eq([order])
      end

      it "redirects to root and displays flash message if user is not admin" do
        sign_in(create(:user))
        order = create(:order)
        get :index
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end
  end

  describe "GET#show" do
    it "assigns order to @order and show all @drivers" do
      sign_in(create(:user))
      order = create(:order)
      get :show, params: { id: order.id }
      expect(assigns(:order)). to eq(order)
      expect(assigns(:ddrivers)).to eq(Ddriver.all)
    end
  end

  describe "GET#new" do
    context "assigns a new order to @order and set delivery_fee" do 
      it "when user is located less than 3km from store" do
        sign_in(create(:user))
        create(:delivery_fee, id: 1)
        get :new
        expect(assigns(:delivery_fee)).to eq(DeliveryFee.find(1))
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "when user is located more than 3km and less than 5km from store" do
        user = create(:user)
        user.update(address: "Rua do Ginjal 69, Almada", latitude: 38.6850637, longitude: -9.1573493)
        sign_in(user)
        create(:delivery_fee, id: 2)
        get :new
        expect(assigns(:delivery_fee)).to eq(DeliveryFee.find(2))
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "when user is located more than 5km and less than 10km from store" do
        user = create(:user)
        user.update(address: "Estrada Da Outurela 42, 2790-113 Carnaxide, Lisbon", latitude: 38.7239215, longitude: -9.2298727)
        sign_in(user)
        create(:delivery_fee, id: 3)
        get :new
        expect(assigns(:delivery_fee)).to eq(DeliveryFee.find(3))
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "when user is located more than 10km from store" do
        user = create(:user)
        user.update(address: "Rua Bulhão Pato 2, Lisboa", latitude: 38.7054925, longitude: -9.3050684)
        sign_in(user)
        create(:delivery_fee, id: 4)
        get :new
        expect(assigns(:delivery_fee)).to eq(DeliveryFee.find(4))
        expect(assigns(:order)).to be_a_new(Order)
      end
    end
  end
end