class BillLinesController < ApplicationController 
  def create
    bill = Bill.find_by_id(params[:bill_id])
    bill.lines.create(:food_id => params[:food_id])
    redirect_to edit_bill_path(bill)
  end
end
