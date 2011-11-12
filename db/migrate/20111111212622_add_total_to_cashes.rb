class AddTotalToCashes < ActiveRecord::Migration
  def up
    add_column :cashes, :total, :decimal, :precision => 10, :scale => 2

    Cash.where("closed_at is not NULL").each do |c|
      c.total = c.lines.sum(:price)
      c.save!
    end

  end

  def down
    remove_column :cashes, :total
  end
end
