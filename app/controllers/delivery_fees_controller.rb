class DeliveryFeesController < ApplicationController
  before_action :set_delivery_fee, only: [:edit, :update]

  def index
    @delivery_fees = DeliveryFee.all
  end
  
  def edit
  end

  def update
    if @delivery_fee.update(delivery_fee_params)
      redirect_to @delivery_fee, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_delivery_fee
      @delivery_fee = DeliveryFee.find(params[:id])
    end

    def delivery_fee_params
      params.require(:delivery_fee).permit(:price)
    end
end
