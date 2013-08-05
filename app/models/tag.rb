class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :venues, :through => :taggings, :source => :taggable, :source_type => "Venue"

  has_many :items, :through => :taggings, :source => :taggable, :source_type => "Item"

  has_many :taggings
end
