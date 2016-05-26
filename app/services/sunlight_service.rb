class SunlightService

  def initialize
    @_conn = Faraday.new(url: "https://congress.api.sunlightfoundation.com/")
  end

  def legislators(params)
    results(params).map { |raw_legislator|
      OpenStruct.new(raw_legislator)
    }
  end

  private
    def results(params)
      JSON.parse(response(params).body)["results"]
    end

    def response(params)
      @_conn.get "/legislators", params.merge(apikey: ENV["sunlight_apikey"])
    end

  # def legislators(params)
  #   connection = Faraday.new(url: "https://congress.api.sunlightfoundation.com/")
  #   response = connection.get "/legislators", params.merge(apikey: ENV["sunlight_apikey"])
  #   results = JSON.parse(response.body)["results"]
  #   results.map { |raw_legislator|
  #     OpenStruct.new(raw_legislator)
  #   }
  # end

end
