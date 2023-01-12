class AddCoordinatesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    remove_column :users, :street_name
    remove_column :users, :house_number
  end
end
