class Cart < ActiveRecord::Base
    has_many :order_products, dependent: :destroy
    has_many :products, through: :order_products
  
    def sub_total
      sum = 0
      self.line_items.each do |line_item|
        sum+= line_item.total_price
      end
      return sum
    end
  end