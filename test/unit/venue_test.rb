# == Schema Information
#
# Table name: venues
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  address_1         :string(255)
#  address_2         :string(255)
#  zip               :integer
#  city              :string(255)
#  state             :string(255)
#  rating            :float
#  img_url           :string(255)
#  biz_url           :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  neighborhood_name :string(255)
#  neighborhood_id   :integer
#  YID               :string(255)
#  snippet_text      :string(255)
#  mobile_url        :string(255)
#  closed            :string(255)
#

require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
