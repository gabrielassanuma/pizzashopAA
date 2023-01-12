class CartsController < ApplicationController
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.order_products.each do | cart_product |
      cart_product.destroy
    end
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def delivery_fee
    # set store location
    # compare user location / store location
    # conditional price 
  end

end