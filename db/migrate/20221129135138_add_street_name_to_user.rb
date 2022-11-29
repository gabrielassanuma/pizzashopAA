class AddStreetNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street_name, :string
  end
end
