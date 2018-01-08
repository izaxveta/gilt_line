class User < ApplicationRecord
  validates :first_name,
            :last_name,
            :email,
            presence: true
  validates_uniqueness_of :email
  has_secure_password

  has_many :user_brands
  has_many :brands, through: :user_brands

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_birthday
    birthday.strftime('%B %-d, %Y') if !birthday.nil?
  end
end