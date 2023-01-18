class AddDeliveryFeeIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :delivery_fee_id, :bigint
    add_index :orders, :delivery_fee_id
  end
end
