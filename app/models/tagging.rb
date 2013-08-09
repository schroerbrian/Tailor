# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  taggable_id   :integer
#  taggable_type :string(255)
#  tag_id        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Tagging < ActiveRecord::Base
  attr_accessible :name
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
end
