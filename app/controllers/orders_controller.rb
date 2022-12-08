class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

  end

  private

  def order_params
    params.require(:order).permit(:, :ends_at, :comment)
  end

end
