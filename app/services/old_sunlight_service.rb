class SunlightService

  def legislators(params)
    connection = Faraday.new(url: "https://congress.api.sunlightfoundation.com/")
    response = connection.get "/legislators", params.merge(apikey: ENV["sunlight_apikey"])
    # byebug
    results = JSON.parse(response.body)["results"]
    results.map { |raw_legislator|
      OpenStruct.new(raw_legislator)
    }
  end

end
