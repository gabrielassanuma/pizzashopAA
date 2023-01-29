# SCHEMA DDRIVERS
# create_table "ddrivers", force: :cascade do |t|
#   t.string "first_name"
#   t.string "last_name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.boolean "active", default: true
# end

class Ddriver < ApplicationRecord
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true


  def deactive!
    update(active: false)
  end
end
