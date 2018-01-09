class VenueCategory < ApplicationRecord
  validates :name, presence: true

  has_many :venue_category_labels
  has_many :labels, through: :venue_category_labels

  def self.generate_venue_categories(categories_data)
    whitelisted_data = venue_categories_filter(categories_data).compact
    whitelisted_data.map { |data| VenueCategory.find_or_create_by(name: data["title"]) }
  end

  def self.venue_categories_filter(categories_data)
    categories_data.map do |category|
      restaurant_filter(category) if category["parents"].include?('restaurants')
    end
  end

  def self.restaurant_filter(category)
    return category if category["country_whitelist"] && category["country_whitelist"].include?("US")
    return category if category["country_whitelist"].nil? && category["country_blacklist"].nil?
  end
end