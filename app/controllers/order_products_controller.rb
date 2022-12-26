class OrderProductsController < ApplicationController
  def create
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
    if current_cart.products.include?(chosen_product)
      @order_product = current_cart.order_products.find_by(:product_id => chosen_product)
      @order_product.quantity += 1
    else
      @order_product = OrderProduct.new
      @order_product.cart = current_cart
      @order_product.product = chosen_product
    end
    @order_product.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy
    redirect_to cart_path(@current_cart)
  end  

  def add_quantity
    @rder_product = OrderProduct.find(params[:id])
    @order_product.quantity += 1
    @order_product.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    @rder_product = OrderProduct.find(params[:id])
    if @order_product.quantity > 1
      @order_product.quantity -= 1
    end
    @order_product.save
    redirect_to cart_path(@current_cart)
  end
    
  private
  
  def order_product_params
    params.require(:order_product).permit(:quantity,:product_id, :cart_id)
  end
end
