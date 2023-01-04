class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_one :ddriver

  def ready!
    update(order_status: "ready")
  end
end
