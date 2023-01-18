class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :edit, :ready, :finalize, :track, :accept]
  def index
    @orders = Order.all
  end

  def show
    @ddrivers = Ddriver.all
  end

  def new
    @order = Order.new
    distance = Geocoder::Calculations.distance_between([current_user.latitude, current_user.longitude], [38.7246365, -9.1509999])
    if distance < 3
      @delivery_fee = DeliveryFee.find(1)
    elsif distance < 5
      @delivery_fee = DeliveryFee.find(2)
    elsif distance < 10
      @delivery_fee = DeliveryFee.find(3)
    elsif distance > 10 && distance < 20
      @delivery_fee = DeliveryFee.find(4)
    end
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @current_cart.order_products.each do |item|
        item.update_column(:order_id, @order.id)
        item.update_column(:cart_id, nil)
      end
      @current_cart.destroy
      session[:cart_id] = nil
      redirect_to track_order_path(@order), notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def repeat
    order = Order.find(params[:id])
    current_cart = @current_cart
    current_cart.order_products.clear
    order.order_products.each do |order_product|
      item = OrderProduct.new(cart: current_cart, product: order_product.product)
      item.save
    end
    redirect_to cart_path
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

  def finalize
    @order.finalize!
    redirect_to front_store_path, notice: 'Order was finalized'
  end

  def accept
    @order.accept!
    redirect_to front_store_path, notice: 'Order was accepted'
  end

  def track
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :total_price, :order_status, :ddriver_id, :take_away_name, :take_away_phone, :delivery_fee )
    end
  
end