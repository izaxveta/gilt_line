class GiltGenerator

  def self.venue_suggestions(categories)
    venues = categories.map {|category| VenueCategory.find_or_create_by(name: category)}
    venues_with_labels = venues.select { |venue| !venue.labels.empty? }
    gilt_generator_sequence(venues_with_labels) if !venues_with_labels.empty?
  end

  def self.sort_apparel(collection)
    collection.select {|item| item if item.categories.include?("Apparel")}
  end

  def self.sort_shoes(collection)
    collection.select {|item| item if item.categories.include?("Shoes")}
  end

  def self.sort_accessories(collection)
    collection.select {|item| item if item.categories.include?("Accessories")}
  end

  private

    def self.gilt_generator_sequence(venues)
      labels = fetch_labels(venues)
      query = formulate_query(labels)
      raw_data = get_items_from_service(query)[:products]
      generate_items(raw_data)
    end

    def self.fetch_labels(venues)
      venues.map {|venue| venue.labels }.flatten.uniq
    end

    def self.generate_items(items_data)
      items_data.map { |item| Item.new(item) }
    end

    def self.formulate_query(labels)
      labels.map {|label| "&brand=#{label.name}"}.join
    end

    def self.get_items_from_service(query)
      @fashion_items_data ||= gilt_service.get_items(query)
    end

    def self.gilt_service
      @gilt_service ||= GiltService.new
    end
end