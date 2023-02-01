require 'rails_helper'

RSpec.describe "Customers", type: :system do
  before do
    driven_by(:rack_test)
  end
  describe "ORDER#TESTS" do
    it "should login and show menu" do
      login_as(create(:user))
      visit root_path 
      expect(page).to have_content("Pizzas") 
    end

    it "should go to pizza menu when click on pizza icon" do
      login_as(create(:user))
      visit pizzas_path
      expect(page).to have_button("Add to cart")
    end
  end

  
end