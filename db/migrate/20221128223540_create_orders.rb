class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.float :total_price, :default => 0
      t.string :order_status, :default => "new_order"

      t.timestamps
    end
  end
end
