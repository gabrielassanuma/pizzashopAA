class Product < ApplicationRecord
  validates :name, :description, :price, :subclass, presence: true

  def deactive!
    update(active: false)
  end

end
