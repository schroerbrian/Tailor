# == Schema Information
#
# Table name: tags
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  taggable_id   :integer
#  taggable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :name
  # has_many :venues, :through => :taggings, :source => :taggable, :source_type => "Venue"
  # has_many :items, :through => :taggings, :source => :taggable, :source_type => "Item"
  has_many :taggings, :dependent => :destroy
  has_many :taggables, :through => :taggings
end
