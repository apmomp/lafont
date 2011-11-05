class ModifyBillLines < ActiveRecord::Migration
  def up
    change_table :bill_lines do |t|
      t.string :name
      t.decimal :price, :precision => 6, :scale => 2
    end

    BillLine.all.each do |bl|
      bl.name = bl.food.name
      bl.price = bl.food.price
      bl.save
    end

    remove_column :bill_lines, :food_id
    
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover food_id from bill_lines"
  end
end
