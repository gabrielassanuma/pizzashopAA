class Product < ApplicationRecord
  validates :name, :description, :price, :subclass, :active, presence: true

  def deactive!
    update(active: false)
  end

end
