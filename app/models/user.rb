class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :order
  validates :phone_number, length: { is: 9 }, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :phone_number, :username, :street_name, :house_number, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
