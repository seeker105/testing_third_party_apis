class SunlightService

  def legislators(params)
    connection = Faraday.new(url: "https://congress.api.sunlightfoundation.com/")
    connection.get "/legislators"
    # byebug
    results = JSON.parse(response.body)["results"]
    results.map { |raw_legislator|
      OpenStruct.new(raw_legislator)
    }
  end

end
