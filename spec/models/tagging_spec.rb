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

require 'spec_helper'

describe Tagging do
  pending "add some examples to (or delete) #{__FILE__}"
end
