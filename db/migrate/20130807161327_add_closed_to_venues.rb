class AddClosedToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :closed, :string
  end
end
