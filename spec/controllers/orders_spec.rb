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
      it "when user is located less than 3km from store should assigns zone A" do
        sign_in(create(:user))
        create(:delivery_fee, id: 1)
        get :new
        expect(assigns(:delivery_fee)).to eq(DeliveryFee.find(1))
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "when user is located more than 3km and less than 5km from store should assigns zone B" do
        user = create(:user)
        user.update(address: "Rua do Ginjal 69, Almada", latitude: 38.6850637, longitude: -9.1573493)
        sign_in(user)
        create(:delivery_fee, id: 2)
        get :new
        expect(assigns(:delivery_fee)).to eq(DeliveryFee.find(2))
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "when user is located more than 5km and less than 10km from store should assigns zone C" do
        user = create(:user)
        user.update(address: "Estrada Da Outurela 42, 2790-113 Carnaxide, Lisbon", latitude: 38.7239215, longitude: -9.2298727)
        sign_in(user)
        create(:delivery_fee, id: 3)
        get :new
        expect(assigns(:delivery_fee)).to eq(DeliveryFee.find(3))
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "when user is located more than 10km from store should assigns zone D" do
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

  describe "POST#create" do
    let(:order_params) { { name: "John Doe", address: "123 Main St", email: "johndoe@example.com" } }
    let(:cart) { create(:cart) }
    let(:order_product) { create(:order_product, cart: cart) }


    it "creates a new order and assigns it to the current cart's order products" do
      post :create, params: { order: order_params }

      expect(Order.count).to eq(1)
      expect(order_product.reload.order_id).to eq(Order.first.id)
      expect(order_product.reload.cart_id).to be_nil
    end

    it "destroys the current cart and sets the session cart_id to nil" do
      post :create, params: { order: order_params }

      expect(cart).to have_received(:destroy)
      expect(session[:cart_id]).to be_nil
    end

    it "redirects to the track order path with a notice" do
      post :create, params: { order: order_params }

      expect(response).to redirect_to(track_order_path(Order.first))
      expect(flash[:notice]).to eq("Order was successfully created.")
    end

    context "when the order is not valid" do
      before do
        allow_any_instance_of(Order).to receive(:save).and_return(false)
      end

      it "renders the new template with a unprocessable_entity status" do
        post :create, params: { order: order_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

end