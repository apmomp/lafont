class AddStateToBills < ActiveRecord::Migration
  def change
    add_column :bills, :state_id, :integer, :default => 1
  end
end
