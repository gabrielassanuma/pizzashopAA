class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
 
  def home
    @user = current_user
  end

  def my_orders
    @orders = Order.where(id: current_user)
  end
  
  def pizzas
    @pizzas = Product.where(subclass: "pizza")
  end

  def drinks
    @drinks = Product.where(subclass: "drink")
  end

  def desserts
    @desserts = Product.where(subclass: "dessert")
  end

  def kitchen
    @orders = Order.all
  end

  def front_store
    @orders = Order.all
  end

end
