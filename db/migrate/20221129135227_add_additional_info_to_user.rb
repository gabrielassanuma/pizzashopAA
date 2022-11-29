class AddAdditionalInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :additional_info, :string
  end
end
