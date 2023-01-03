class AddDdriverToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :ddriver, foreign_key: true
  end
end
