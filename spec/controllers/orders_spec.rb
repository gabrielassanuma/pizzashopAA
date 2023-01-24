require 'rails_helper'

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
    it "assigns a new order to @order and set delivery_fee" do
      sign_in(create(:user))
      get :new
      expect(assigns(:delivery_fee)).to eq(DeliveryFee.find(1))
      expect(assigns(:order)).to be_a_new(Order)
    end
  end
end