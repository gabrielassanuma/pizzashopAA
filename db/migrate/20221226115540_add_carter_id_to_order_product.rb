class AddCarterIdToOrderProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_products, :cart , index: true
    add_column :order_products, :quantity , :integer, :default => 1
  end
end
