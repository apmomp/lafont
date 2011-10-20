class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :desc
      t.decimal :price
      t.integer :food_cat_id

      t.timestamps
    end
  end
end
