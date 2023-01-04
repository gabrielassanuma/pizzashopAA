class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :edit, :ready]
  def index
    @orders = Order.all
  end

  def show
    @ddrivers = Ddriver.all
  end

  def new
    @cart = @current_cart
    @user = current_user  
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(user_id: current_user.id, order_status: "new_order", total_price: @current_cart.sub_total, ddriver_id: nil)
    if @order.save
      @current_cart.order_products.each do |item|
        item.update_column(:order_id, @order.id)
        item.update_column(:cart_id, nil)
      end
      @current_cart.destroy
      session[:cart_id] = nil
      redirect_to track_path, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      redirect_to front_store_path , notice: 'Ddriver was successfully added to Order.'
    else
      render :edit
    end
  end

  def ready
    @order.ready!
    redirect_to kitchen_path, notice: 'Order was marked as ready'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :total_price, :order_status, :ddriver_id )
    end
  
end