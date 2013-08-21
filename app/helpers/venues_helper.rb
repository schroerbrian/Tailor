module VenuesHelper

require 'open-uri'
require 'json'

  def wunderweather
    url = 'http://api.wunderground.com/api/749186801b144fe7/hourly/q/CA/San_Francisco.json'
    result = JSON.parse(open(url).read)
    return result
  end

  def male_cat
    return ['Tops','Bottoms', 'Belts', 'Shoes']
  end

  def female_cat
    return ['Tops','Bottoms', 'Dresses', 'Handbags', 'Bracelets', 'Belts', 'Scarves', 'Legwear', 'Sandals', 'Necklaces', 'Shoes']
  end

end

