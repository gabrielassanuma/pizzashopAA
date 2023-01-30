# SCHEMA DELIVERY_FEES
# create_table "delivery_fees", force: :cascade do |t|
#   t.string "zone"
#   t.float "price"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class DeliveryFee < ApplicationRecord
  has_many :orders
  validates :zone, presence: true
  validates :price, presence: true
end
