class Product < ApplicationRecord

  private 
  
  def deactive!
    update(active: false)
  end

end
