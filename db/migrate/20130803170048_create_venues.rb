class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.integer :zip
      t.string :city
      t.string :state
      t.float :rating
      t.string :img_url
      t.string :biz_url
      t.timestamps


    end
  end
end
