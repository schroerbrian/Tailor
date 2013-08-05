class AddNeighborhoodIdToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :neighborhood_id, :integer
    add_index :venues, :neighborhood_id, :name => 'neighborhood_id_ix'
  end
end
