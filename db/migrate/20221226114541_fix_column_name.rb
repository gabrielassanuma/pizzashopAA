class FixColumnName < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :products, :product_name, :name
    rename_column :products, :product_description, :description
  end
end
