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
end