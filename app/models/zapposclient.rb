require 'open-uri'
require 'json/pure'
require 'pstore'
class Zapposclient
  attr_accessor :info, :results, :gender, :category

  def initialize(options={}, info=[])
    @gender = options[:gender]
    @category = options[:category]
    @info = :info
  end

  def zappos_data
   options = {:gender => self.gender, :category => self.category}
   request = hot_items(options)
   results = request['results']
   if results.empty?
     options = {:category => category}
     request = hot_items(options)
     results = request['results']
   end
   @info = results.map { |r|
                    { :item => {
                    :name => r['productName'],
                    :brand => r['brandName'],
                    :price => r['price'],
                    :item_url => r['defaultProductUrl'],
                    :img_url => image(r['styleId']),
                    :gender => gender }
                  }
    }
  end

  def hot_items(options={})
    gender = options[:gender] if options.key?(:gender)
    category = options[:category]
    if gender
      filter = '&filters={"gender":'+'"'+"#{gender}" +'"'+  ',"categorization":{"categoryType":' + '"' + "#{category}" +'"'+ "}}"
    else
      filter = '&filters={"categorization":{"categoryType":' + '"' + "#{category}" +'"'+ "}}"
    end
    url = 'http://api.zappos.com/Statistics?type=latestStyles'+filter+'&location={"state":"ca","city":"San Francisco"}&limit=27&key=' + "#{ENV['ZAPPOS_KEY']}"
    updated_url = URI.encode(url)
    result = JSON.parse(open(updated_url.strip).read)
  end

  def image(id)
    slash_id = id.split(//).shift(id.length-1)
    slashed_string = slash_id.inject("") { |n,l| n + l + '/'}
    url = "http://www.zappos.com/images/z/" + "#{slashed_string}" + "#{id}" + "-p-DETAILED.jpg"
  end





end
