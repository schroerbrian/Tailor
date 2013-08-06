module VenuesHelper

require 'open-uri'
require 'json'

  def wunderweather

    url = 'http://api.wunderground.com/api/749186801b144fe7/hourly/q/CA/San_Francisco.json'
    result = JSON.parse(open(url).read)
    return result

  end

end
