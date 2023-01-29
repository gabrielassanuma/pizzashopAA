# SCHEMA ORDERS
# create_table "orders", force: :cascade do |t|
#   t.bigint "user_id", null: false
#   t.float "total_price", default: 0.0
#   t.string "order_status", default: "new_order"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.bigint "ddriver_id"
#   t.string "take_away_name"
#   t.string "take_away_phone"
#   t.bigint "delivery_fee_id"
#   t.index ["ddriver_id"], name: "index_orders_on_ddriver_id"
#   t.index ["delivery_fee_id"], name: "index_orders_on_delivery_fee_id"
#   t.index ["user_id"], name: "index_orders_on_user_id"
# end

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  belongs_to :ddriver, optional: true
  belongs_to :delivery_fee



  def ready!
    update(order_status: "ready")
  end

  def finalize!
    update(order_status: "finalized")
  end

  def accept!
    update(order_status: "accepted")
  end

end
