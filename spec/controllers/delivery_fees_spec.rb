require 'rails_helper'

RSpec.describe DeliveryFeesController, type: :controller do

  describe "#require_admin" do
    context "when user is admin" do
      it "allows the action to proceed" do
        sign_in(create(:user, :admin))
        get :index
        expect(response).to be_successful
      end
    end

    context "when user is not admin" do
      it "redirects to the root path" do
        sign_in(create(:user))
        get :index
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        sign_in(create(:user))
        get :index
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end
  end

  describe "GET#index" do
    it "assings all delivery fees to @delivery_fees" do
      sign_in(create(:user, :admin))
      delivery_fee = create(:delivery_fee)
      get :index
      expect(assigns(:delivery_fees)).to eq([delivery_fee])
    end
  end

  describe "GET#edit" do
    it "assigns the requested delivery_fee to @delivery_fee" do
      sign_in(create(:user, :admin))
      delivery_fee = create(:delivery_fee, id: 1)
      get :edit, params: { id: delivery_fee.id }
      expect(assigns(:delivery_fee)).to eq(delivery_fee)
    end
  end

  describe "PUT#update" do
    context "with valid params" do
      it "update the requested delivery_fee" do
        sign_in(create(:user, :admin))
        delivery_fee = create(:delivery_fee, id:1 )
        put :update, params: { id: delivery_fee.id, delivery_fee: { price: 3 } }
        delivery_fee.reload
        expect(delivery_fee.price).to eq(3)
      end

      it "redirects to the updated delivery_fee" do
        sign_in(create(:user, :admin))
        delivery_fee = create(:delivery_fee, id:1 )
        put :update, params: { id: delivery_fee.id, delivery_fee: { price: 3 } }
        expect(response).to redirect_to(delivery_fee)
      end
    end
  end
end