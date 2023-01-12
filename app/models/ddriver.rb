class Ddriver < ApplicationRecord
  has_many :orders


  def deactive!
    update(active: false)
  end
end
