# == Schema Information
#
# Table name: catalogs
#
#  id          :integer          not null, primary key
#  category_id :integer
#  item_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Catalog < ActiveRecord::Base

  belongs_to :category
  belongs_to :item

end
