class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @user = current_user
    @order = Order.new
  end

  def create
    order = Order.new
    order.user_id = current_user
    order.order_status = "new_order"
    @current_cart.order_products.each do |item|
      @order.order_products << item
      item.cart_id = nil
    end
    order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end
  
end