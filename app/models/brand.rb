class Brand < ApplicationRecord
  has_many :user_brands
  has_many :users, through: :user_brands
end
