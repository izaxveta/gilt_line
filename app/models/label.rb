class Label < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :user_labels
  has_many :users, through: :user_labels

  has_many :venue_category_labels
  has_many :venue_categories, through: :venue_category_labels
end
