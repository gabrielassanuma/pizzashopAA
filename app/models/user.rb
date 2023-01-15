class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :order
  has_one :DeliveryFee
  validates :phone_number, length: { is: 9 }, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :phone_number, :username, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validate :distance_from_store

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def distance_from_store
    geocode
    if self.latitude.present? && self.longitude.present?
      distance = Geocoder::Calculations.distance_between([self.latitude, self.longitude], [38.7246365, -9.1509999])
      if distance < 3
        self.delivery_fee_id = 1
      elsif distance < 5
        self.delivery_fee_id = 2
      elsif distance < 10
        self.delivery_fee_id = 3
      elsif distance <= 20
        self.delivery_fee_id = 4
      else
        errors.add(:address, "Sorry, is too far from store")
      end
    end
  end
end
