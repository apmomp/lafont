class BillLinesController < ApplicationController 
  def create
    @bill = Bill.find_by_id(params[:bill_id])
    food = Food.find_by_id(params[:food_id])
    name = Name.find_by_name(food.name)
    if name.nil?
      name = Name.create!(:name => food.name)
    end
    @bill.lines.create!(:name_id => name.id, :price => food.price)

    respond_to do |format|
      format.js
    end
  end

  def destroy
    bill_line = BillLine.find_by_id([params[:id]])
    @bill = bill_line.bill
    bill_line.destroy
    
    respond_to do |format|
      format.js { render 'create' }
    end
  end
end
