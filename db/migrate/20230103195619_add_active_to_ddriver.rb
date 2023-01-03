class AddActiveToDdriver < ActiveRecord::Migration[7.0]
  def change
    add_column :ddrivers, :active, :boolean, default: true
  end
end