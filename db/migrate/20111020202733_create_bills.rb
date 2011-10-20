class CreateBills < ActiveRecord::Migration
  def change
    create_table :bill_lines do |t|
      t.integer :food_id
      t.integer :bill_id

      t.timestamps
    end

    create_table :bills do |t|
      t.string :name
      t.integer :user_id
    end
  end

end
