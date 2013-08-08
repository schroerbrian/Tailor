module VenuesHelper

require 'open-uri'
require 'json'

  def wunderweather

    url = 'http://api.wunderground.com/api/749186801b144fe7/hourly/q/CA/San_Francisco.json'
    result = JSON.parse(open(url).read)
    return result

  end

  @lesbians = []

  def venue_items
  	Item.all.each do |x| 
  		x.tags.find_by_name("lesbian") 
  	end
  end 

end

ids = v.tags.map { |t| t.id }

Item.all.each { |item| 
	item.name if item.tags.id.include? }

	venue_tag_ids = v.tags.map { |v| v.id }
	
	Item.all.each { |item| 
		item.tags 
	}

	item_tag_ids = i.tags




	newarray = ids.keep_if { |i| } 