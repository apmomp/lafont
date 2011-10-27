class AddCashIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :cash_id, :integer
  end
end
