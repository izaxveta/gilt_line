class GiltService
  def get_items(query)
    get_json("products?q=women" + query)
  end

  private

    attr_reader :connection

    def get_json(query)
      response = connection.get(query)
      JSON.parse(response.body, symbolize_names: true)
    end

    def connection
      @connection ||= Faraday.new(url: 'https://api.gilt.com/v1/') do |faraday|
        faraday.headers['apikey'] = ENV['GILT_API_KEY']
        faraday.adapter Faraday.default_adapter
      end
    end
end