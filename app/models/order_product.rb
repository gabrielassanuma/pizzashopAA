class OrderProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart
  
  private 
  
  def total_price
    self.quantity.to_s.to_d * self.product.price.to_s.to_d
  end
end
