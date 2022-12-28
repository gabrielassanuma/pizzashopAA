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
    @order = Order.new(user_id: current_user.id, order_status: "new_order", total_price: @current_cart.sub_total)
    if @order.save
      @current_cart.order_products.each do |item|
        item.update(order_id: @order.id)
      end
      @current_cart.destroy
      session[:cart_id] = nil
      redirect_to track_path notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
end