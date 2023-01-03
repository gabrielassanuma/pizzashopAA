class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @user = current_user
  end

  def track
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
    @products = Product.all
  end

  def front_store
    @orders = Order.all
  end
end
