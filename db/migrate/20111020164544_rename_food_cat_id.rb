class RenameFoodCatId < ActiveRecord::Migration
  def change
    remove_column :foods, :food_cat_id
    add_column :foods, :cat_id, :integer
  end

end
