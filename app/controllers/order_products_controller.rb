class OrderProductsController < ApplicationController
  before_action :set_order_product, only: [:add_quantity, :reduce_quantity, :destroy]

  def create
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
    @order_product = current_cart.order_products.find_or_initialize_by(product: chosen_product)
    if @order_product.new_record?
      @order_product.cart = current_cart
    else
      @order_product.quantity += 1
    end
    @order_product.save
    if @order_product.product.subclass == "pizza"
      redirect_to pizzas_path, notice: 'Product was successfully added to Cart.'
    elsif @order_product.product.subclass == "drink"
      redirect_to drinks_path, notice: 'Product was successfully added to Cart.'
    else
      redirect_to desserts_path, notice: 'Product was successfully added to Cart.'

    end
    
  end 

  def add_quantity
    @order_product.quantity += 1
    @order_product.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    if @order_product.quantity > 1
      @order_product.quantity -= 1
    end
    @order_product.save
    redirect_to cart_path(@current_cart)
  end

  def destroy
    @order_product.destroy
    redirect_to cart_path(@current_cart)
  end 
    
  private
  
  def set_order_product
    @order_product = OrderProduct.find(params[:id])
  end
  
  def order_product_params
    params.require(:order_product).permit(:quantity, :product_id, :cart_id)
  end
end




