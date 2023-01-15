class DeliveryFeesController < ApplicationController

  def index
    @delivery_fees = DeliveryFee.all
  end
  
  def edit
    @delivery_fee = DeliveryFee.find(params[:id])
  end
end
