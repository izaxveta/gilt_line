class Venue
  attr_reader :name,
              :categories,
              :price,
              :rating,
              :review_count,
              :phone,
              :location,
              :image_url

  def initialize(data)
    @name         = data[:name]
    @categories   = get_categories(data[:categories])
    @price        = data[:price]
    @rating       = data[:rating]
    @review_count = data[:review_count]
    @phone        = data[:phone]
    @location     = data[:location][:display_address]
    @image_url    = data[:image_url]
  end

  def get_categories(category_data)
    category_data.map { |category| category[:title] }
  end

  def self.search_venues(filter)
    raw_venue_data = venue_service.get_venues_by_location(filter)[:businesses]
    generate_venues(raw_venue_data)
  end

  private
    def self.generate_venues(venues)
      venues.map { |venue| Venue.new(venue) }
    end

    def self.venue_service
      @venue_service ||= VenueService.new
    end
end