class VenueCategory < ApplicationRecord
  validates :name, presence: true

    whitelisted_data = venue_categories_filter(categories_data).compact
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