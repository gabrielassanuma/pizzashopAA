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
    end

    it "should show added product on cart show" do
      login_as(create(:user))
      create(:product, subclass: "pizza")
      cart = create(:cart)
      session[:cart_id] = cart.id
      allow(Cart).to receive(:find_by).and_return(cart)
      click_link "Cart", href: "/cart/#{cart.id}"
      save_and_open_page
    end


  end

  
end