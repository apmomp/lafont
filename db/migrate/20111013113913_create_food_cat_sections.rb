class CreateFoodCatSections < ActiveRecord::Migration
  def change
    create_table :food_cat_sections do |t|
      t.string :name

      t.timestamps
    end
  end
end
