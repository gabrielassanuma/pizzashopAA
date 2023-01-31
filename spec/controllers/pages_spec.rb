require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET#home" do
    it "should set user to current_user" do
      user = create(:user)
      sign_in user
      get :home
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET#myorders" do
    it "should set all order from user to @orders" do
      user = create(:user)
      sign_in user
      order = create(:order, user_id: user.id)
      get :my_orders
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET#pizzas" do
    it "should set all products subclass: 'pizza' to @pizzas" do
      user = create(:user, :admin)
      sign_in user
      pizza = create(:product, subclass: "pizza")
      get :pizzas
      expect(assigns(:pizzas)).to eq([pizza])
    end
  end

  describe "GET#drinks" do
    it "should set all products subclass: 'drink' to @drinks" do
      sign_in(create(:user, :admin))
      drink = create(:product, subclass: "drink")
      get :drinks
      expect(assigns(:drinks)).to eq([drink])
    end
  end

  describe "GET#desserts" do
    it "should set all products subclass: 'dessert' to @desserts" do
      sign_in(create(:user, :admin))
      dessert = create(:product, subclass: "dessert")
      get :desserts
      expect(assigns(:desserts)).to eq([dessert])
    end
  end

  describe "GET#kitchen" do   
    it "should set all orders to @orders" do
      sign_in(create(:user, :admin))
      order = create(:order)
      get :kitchen
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET#front_store" do   
    it "should set all orders to @orders" do
      sign_in(create(:user, :admin))
      order = create(:order)
      get :front_store
      expect(assigns(:orders)).to eq([order])
    end
  end
end