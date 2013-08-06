require 'open-uri'
require 'json'
class Item < ActiveRecord::Base
  attr_accessible :name, :brand, :price, :item_url, :img_url, :rating, :gender

  has_many :categories, :through => :catalogs
  has_many :catalogs
  has_many :tags, :through => :taggings
  has_many :taggings, :as => :taggable, :dependent => :destroy

  validates_presence_of :name


  def self.hot_items(options={})
    gender = options[:gender]
    category = options[:category]
    filter = '&filters={"gender":'+'"'+"#{gender}" +'"'+  ',"categorization":{"categoryType":' + '"' + "#{category}" +'"'+ "}}"
    url = 'http://api.zappos.com/Statistics?type=latestStyles'+filter+'&location={"state":"ca","city":"San Francisco"}&key=' + "#{ENV['ZAPPOS_KEY']}"
    updated_url = URI.encode(url)
    result = JSON.parse(open(updated_url.strip).read)
  end

  def self.image(id)
    info_hash = {}
    url = "http://api.zappos.com/Product/"+"#{id}"+'?includes=["styles"]&key='+"#{ENV['ZAPPOS_KEY']}"
    updated_url = URI.encode(url)
    request = JSON.parse(open(updated_url.strip).read)
    img_url = request['product'][0]['defaultImageUrl']
  end

  def self.sf_styles(gender, category)
    options = {:gender => gender, :category => category}
    request = hot_items(options)
    results = request['results']
    results.each { |r|
      i = Item.find_by_name(r['productName'])
      if i.nil?
       i = Item.create(
          :name => r['productName'],
          :brand => r['brandName'],
          :price => r['price'],
          :item_url => r['defaultProductUrl'],
          :img_url => image(r['productId']),
          :gender => gender)
        i.categories << Category.find_by_name(category)
      end
      }
    end

end
