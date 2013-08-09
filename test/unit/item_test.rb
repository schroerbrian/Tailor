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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
