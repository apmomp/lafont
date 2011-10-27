class AddTimestampsToBills < ActiveRecord::Migration
  def change
    change_table :bills do |t|
      t.timestamps
    end
  end
end
