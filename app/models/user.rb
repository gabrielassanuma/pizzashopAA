class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :order
  validates :phone_number, length: { is: 9 }, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :phone_number, :username, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
