# SCHEMA USERS
# create_table "users", force: :cascade do |t|
#   t.string "email", default: "", null: false
#   t.string "encrypted_password", default: "", null: false
#   t.string "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "username"
#   t.string "phone_number"
#   t.string "additional_info"
#   t.boolean "admin", default: false
#   t.string "address"
#   t.float "latitude"
#   t.float "longitude"
#   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
# end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
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
      if distance > 20
        errors.add(:address, "Sorry, is too far from store")
      end
    else
      errors.add(:address, "Sorry, your address is invalid or can't be find by our system, contact store")
    end
  end
end
