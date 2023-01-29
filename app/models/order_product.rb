# SCHEMA ORDER_PRODUCTS
# create_table "order_products", force: :cascade do |t|
#   t.bigint "order_id"
#   t.bigint "product_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.bigint "cart_id"
#   t.integer "quantity", default: 1
#   t.index ["cart_id"], name: "index_order_products_on_cart_id"
#   t.index ["order_id"], name: "index_order_products_on_order_id"
#   t.index ["product_id"], name: "index_order_products_on_product_id"
# end

class OrderProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart
  

  def total_price
    self.quantity.to_s.to_d * self.product.price.to_s.to_d
  end
end
