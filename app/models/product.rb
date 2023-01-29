# SCHEMA PRODUCTS
# create_table "products", force: :cascade do |t|
#   t.string "name"
#   t.string "description"
#   t.float "price"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "subclass"
#   t.boolean "active", default: true
# end

class Product < ApplicationRecord
  validates :name, :description, :price, :subclass, presence: true

  def deactive!
    update(active: false)
  end

end
