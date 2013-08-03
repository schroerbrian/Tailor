class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :items, :through => :catalogs
  has_many :catalogs
end
