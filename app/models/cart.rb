class Cart < ActiveRecord::Base
    has_many :order_products
    has_many :products, through: :order_products
  
    def sub_total
      sum = 0
      self.order_products.each do |order_product|
        sum += order_product.total_price
      end
      return sum
    end
  end