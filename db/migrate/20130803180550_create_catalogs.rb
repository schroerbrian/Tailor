class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.integer :category_id
      t.integer :item_id
      t.timestamps
    end
  end
end
