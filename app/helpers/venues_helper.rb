module VenuesHelper

require 'open-uri'
require 'json'

  def wunderweather

    url = 'http://api.wunderground.com/api/749186801b144fe7/hourly/q/CA/San_Francisco.json'
    result = JSON.parse(open(url).read)
    return result

  end


end




# venue_tag_ids = Venue.last.tags.map { |t| t.id }
#   @item_search = []
#   Item.all.each { |item| item_tag_ids = item.tags.map { |i| i.id }
#     @item_search << item if ((venue_tag_ids & item_tag_ids).count > 0) }

#     @item_search.each do |item|
#     	@tops = []
#     	@other = []
    	
#     	item.each do |i|
#     		i.categories.each do |c|
#     			tops << c if c == "Tops" 
#     	categories
