class AddNeighborhoodToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :neighborhood_name, :string
  end
end
