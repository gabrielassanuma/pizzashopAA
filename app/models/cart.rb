# SCHEMA CARTS
# create_table "carts", force: :cascade do |t|
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

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