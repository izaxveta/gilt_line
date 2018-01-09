class VenueCategory < ApplicationRecord
  validates :name, presence: true

    whitelisted_data = venue_categories_filter(categories_data).compact
  def self.venue_categories_filter(categories_data)
    categories_data.map do |category|
    end
  end
end