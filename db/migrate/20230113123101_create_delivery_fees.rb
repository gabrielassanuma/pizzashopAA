class CreateDeliveryFees < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_fees do |t|
      t.string :zone
      t.float :price

      t.timestamps
    end
  end
end
