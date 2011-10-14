class AddFoodCatSectionIdToFoodCat < ActiveRecord::Migration
  def change
    add_column :food_cats, :food_cat_section_id, :integer
  end
end
