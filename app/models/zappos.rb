require 'open-uri'
require 'json/pure'
require 'pstore'
class Zappos
  attr_accessor :info, :results, :gender, :category

  def zap(gender, category, info=[])
   @info = info
   options = {:gender => gender, :category => category}
   request = hot_items(options)
   results = request['results']
   results.each { |r|
                    @info << { :item => {
                    :name => r['productName'],
                    :brand => r['brandName'],
                    :price => r['price'],
                    :item_url => r['defaultProductUrl'],
                    :img_url => image(r['productId']),
                    :gender => gender }
                  }
    }
  end

  def hot_items(options={})
    gender = options[:gender]
    category = options[:category]
    filter = '&filters={"gender":'+'"'+"#{gender}" +'"'+  ',"categorization":{"categoryType":' + '"' + "#{category}" +'"'+ "}}"
    url = 'http://api.zappos.com/Statistics?type=latestStyles'+filter+'&location={"state":"ca","city":"San Francisco"}&limit=10&key=' + "#{ENV['ZAPPOS_KEY']}"
    updated_url = URI.encode(url)
    result = JSON.parse(open(updated_url.strip).read)
  end

  def image(id)
    begin
    url = "http://api.zappos.com/Product/"+"#{id}"+'?includes=["styles"]&key='+"#{ENV['ZAPPOS_KEY']}"
    updated_url = URI.encode(url)
    request = JSON.parse(open(updated_url.strip).read)
    img_url = request['product'][0]['defaultImageUrl']
    rescue OpenURI::HTTPError => ex
      return ""
    end
  end





end
