class OrderProductsController < ApplicationController
  before_action :set_order_product, only: [:add_quantity, :reduce_quantity, :destroy]

  def create
    current_cart = @current_cart
    product = Product.find(params[:product_id])
    order_product = current_cart.order_products.find_or_initialize_by(product: product)
    order_product.quantity += 1 if order_product.persisted?
    order_product.save
    redirect_path = case product.subclass
                    when "pizza" then pizzas_path
                    when "drink" then drinks_path
                    else desserts_path
                    end
    redirect_to redirect_path, notice: 'Product was successfully added to Cart.'
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




