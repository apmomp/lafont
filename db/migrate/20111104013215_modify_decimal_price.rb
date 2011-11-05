class ModifyDecimalPrice < ActiveRecord::Migration
  def change
    change_column :foods, :price, :decimal, :precision => 6, :scale => 2
  end
end
