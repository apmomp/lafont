class RenameFoodCatSection < ActiveRecord::Migration
  def change
    rename_table :food_cat_sections, :sections
  end

end
