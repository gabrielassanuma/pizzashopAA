class AddDeliveryFeesIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :delivery_fee, foreign_key: true
  end
end
