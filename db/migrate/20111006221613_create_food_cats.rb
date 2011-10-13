class CreateFoodCats < ActiveRecord::Migration
  def change
    create_table :food_cats do |t|
      t.string :name

      t.timestamps
    end
  end
end
