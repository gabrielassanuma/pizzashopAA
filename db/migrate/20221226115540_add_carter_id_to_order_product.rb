class AddCarterIdToOrderProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_products, :cart , index: true
  end
end
