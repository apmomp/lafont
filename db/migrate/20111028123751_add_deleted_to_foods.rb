class AddDeletedToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :deleted, :boolean, :default => false
  end
end
