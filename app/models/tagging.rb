class Tagging < ActiveRecord::Base
  attr_accessible :name
  belongs_to :tag

  belongs_to :taggable, :polymorphic => true
end
