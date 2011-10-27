class CreateCashes < ActiveRecord::Migration
  def change
    create_table :cashes do |t|
    t.datetime :closed_at
    
    t.timestamps  
    end 
    
    
  end
end
