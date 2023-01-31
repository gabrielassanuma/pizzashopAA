require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET#home" do
    it "should set user to current_user" do
      user = create(:user)
      sign_in(user)
      get :home
      
    end
  end
end