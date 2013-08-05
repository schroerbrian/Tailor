class AddStuffToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :snippet_text, :string
    add_column :venues, :mobile_url, :string
  end
end
