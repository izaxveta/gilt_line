class User < ApplicationRecord
  validates :first_name,
            :last_name,
            :email,
            presence: true
  validates_uniqueness_of :email
  has_secure_password

  has_many :user_labels
  has_many :labels, through: :user_labels

  enum role: ['default', 'admin']

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_birthday
    birthday.strftime('%B %-d, %Y') if !birthday.nil?
  end
end