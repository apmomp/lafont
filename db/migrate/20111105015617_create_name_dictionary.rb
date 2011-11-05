class CreateNameDictionary < ActiveRecord::Migration
  def up

    create_table :names do |t|
      t.string :name
    end

    add_index :names, :name

    change_table :bill_lines do |t|
      t.integer :name_id    
    end

    BillLine.all.each do |bl|
      name = Name.find_by_name(bl.name)
      if name.nil?
        name = Name.create!(:name => bl.name)
      end
      bl.name_id = name.id
      bl.save!
    end

    remove_column :bill_lines, :name

    remove_column :foods, :deleted

  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover bill lines' names"
  end

end
