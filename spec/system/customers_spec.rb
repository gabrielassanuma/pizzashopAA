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
      create(:product, subclass: "pizza")
      visit root_path
      click_link "Pizzas", href: "/pizzas"
      expect(page).to have_content("Add to cart")
    end

    it "should add select item to cart" do
      login_as(create(:user))
      create(:product, subclass: "pizza")
      visit pizzas_path
      click_button "Add to cart"
      expect(page).to have_content("Product was successfully added to Cart.")
      expect(:cart).not_to be_nil
    end

    it "on checkout items added to cart should be there with option to delivery it or pick up" do
      login_as(create(:user))
      create(:product, subclass: "pizza")
      create(:delivery_fee, id: 1)
      visit pizzas_path
      click_button "Add to cart"
      visit new_order_path
    end



  end

  
end