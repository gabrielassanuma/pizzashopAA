class Product < ApplicationRecord
  def deactive!
    update(active: false)
  end

end
