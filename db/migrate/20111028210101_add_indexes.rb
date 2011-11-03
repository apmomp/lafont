class AddIndexes < ActiveRecord::Migration
  def change
    add_index :foods, :cat_id
    add_index :food_cats, :section_id
    add_index :bill_lines, :food_id
    add_index :bill_lines, :bill_id
    add_index :bills, :cash_id
    add_index :users, :email, :unique => true 
  end

end
