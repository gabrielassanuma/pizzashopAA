class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_one :ddriver
  has_one :delivery_fee, through: :user


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
