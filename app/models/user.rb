class User < ApplicationRecord
  validates :first_name,
            :last_name,
            :email,
            :moniker,
            presence: true
  validates_uniqueness_of :email, :moniker
  has_secure_password

  has_many :user_labels
  has_many :labels, through: :user_labels

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  enum role: ['default', 'admin']

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_birthday
    birthday.strftime('%B %-d, %Y') if !birthday.nil?
  end
end