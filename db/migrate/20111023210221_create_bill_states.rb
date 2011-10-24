class CreateBillStates < ActiveRecord::Migration
  def change
    create_table :bill_states do |t|
      t.string :name
    end
  end

end
