class Venue < ActiveRecord::Base
  include Yelp::V2::Business::Request
  include Yelp::V2::Search::Request
  attr_accessible :name, :address_1, :address_2, :zip, :city, :state, :rating, :img_url, :biz_url, :YID, :snippet_text, :mobile_url, :neighborhood_name
  has_many :tags, :through => :taggings
  has_many :taggings, :as => :taggable
  belongs_to :neighborhood



end