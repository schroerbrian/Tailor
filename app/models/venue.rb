class Venue < ActiveRecord::Base
  attr_accessible :name, :address_1, :address_2, :zip, :city, :state, :rating, :img_url, :biz_url
  has_many :tags, :as => :taggable
end
