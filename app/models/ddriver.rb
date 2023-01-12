class Ddriver < ApplicationRecord
  has_many :orders

  private
  
  def deactive!
    update(active: false)
  end
end
