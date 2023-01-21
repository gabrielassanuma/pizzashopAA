class Ddriver < ApplicationRecord
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true


  def deactive!
    update(active: false)
  end
end
