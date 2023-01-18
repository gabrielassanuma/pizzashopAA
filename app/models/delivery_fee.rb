class DeliveryFee < ApplicationRecord
  belongs_to :order, optional: true
end
