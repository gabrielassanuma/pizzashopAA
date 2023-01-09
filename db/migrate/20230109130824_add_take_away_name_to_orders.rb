class AddTakeAwayNameToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :take_away_name, :string
    add_column :orders, :take_away_phone, :string
  end
end
