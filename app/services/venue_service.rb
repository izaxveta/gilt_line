class VenueService
  def get_venues_by_location(filter)
    get_json("search?term=restaurants&price=3,4&location=#{filter}")
  end

  private

    def get_json(url)
      response = connection.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def connection
      @connection ||= Faraday.new(url: "https://api.yelp.com/v3/businesses/") do |faraday|
        faraday.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
        faraday.adapter Faraday.default_adapter
      end
    end
end