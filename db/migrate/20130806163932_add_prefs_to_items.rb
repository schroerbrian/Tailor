class AddPrefsToItems < ActiveRecord::Migration
  def change
    add_column :items, :prefs, :text
  end
end
