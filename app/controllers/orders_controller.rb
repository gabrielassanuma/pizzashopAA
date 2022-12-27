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
    @order = Order.new
    @order.user_id = current_user.id
    @order.order_status = "new_order"
    @order.total_price = @current_cart.sub_total
    if @order.save
      @current_cart.order_products.each do |item|
        item.order_id = @order.id
        item.save
      end
      raise
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
end