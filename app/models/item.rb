# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  brand      :string(255)
#  price      :string(255)
#  item_url   :string(255)
#  img_url    :string(255)
#  rating     :integer
#  color      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  likes      :integer
#  gender     :string(255)
#  prefs      :text
#

class Item < ActiveRecord::Base
  attr_accessible :name, :brand, :price, :item_url, :img_url, :rating, :gender, :prefs
  serialize :prefs
  has_many :categories, :through => :catalogs
  has_many :catalogs
  has_many :tags, :through => :taggings
  has_many :taggings, :as => :taggable, :dependent => :destroy

  validates_presence_of :name



end
