class BillLinesController < ApplicationController 
  def create
    @bill = Bill.find_by_id(params[:bill_id])
    @bill.lines.create!(:food_id => params[:food_id])

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
