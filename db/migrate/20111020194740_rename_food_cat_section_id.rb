class RenameFoodCatSectionId < ActiveRecord::Migration
  def change
    rename_column :food_cats, :food_cat_section_id, :section_id
  end

end
