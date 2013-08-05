class AddYidToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :YID, :string
  end
end
