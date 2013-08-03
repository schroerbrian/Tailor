class Item < ActiveRecord::Base
  attr_accessible :name, :brand, :price, :item_url, :img_url, :rating

  has_many :catalogs
  has_many :items, :through => :catalogs
  has_many :tags, :as => :taggable
end
