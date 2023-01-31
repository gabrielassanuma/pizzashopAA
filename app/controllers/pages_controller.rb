class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_orders, only: [:kitchen, :front_store]
 
  def home
    @user = current_user
  end

  def my_orders
    @orders = Order.where(user_id: current_user)
  end

  def take_away
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
  end

  def front_store
  end

  private

    def set_orders
      @orders = Order.all
    end

end
