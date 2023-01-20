class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  belongs_to :ddriver
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
