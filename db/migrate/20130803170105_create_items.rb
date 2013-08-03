class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.float :price
      t.string :item_url
      t.string :img_url
      t.integer :rating
      t.string :color
      t.timestamps
    end
  end
end
