class BillsController < ApplicationController
  def new
    @title = "Nueva mesa"
    @bill = current_user.bills.new
  end

  def create
    @bill = current_user.bills.new(params[:bill])
    if @bill.save
      flash[:success] = "Cuenta creada correctamente"
      redirect_to edit_bill_path(@bill)
    else
      @title = "Nueva mesa"
      
      render :new
    end
  end

  def index
    @title = "Lista de cuentas"
    @bills = Bill.all
  end

  def edit
    @bill = Bill.find_by_id(params[:id])
    @title = "Editando #{@bill.name}"
    sec = (params[:section].nil?) ? 1 : params[:section]
    @foodcats = FoodCat.where("section_id = ?", sec)
  end

  def expand
    @bill = Bill.find_by_id(params[:bill_id])
    respond_to do |format|
      format.js
    end
  end

  def contract
    @bill = Bill.find_by_id(params[:bill_id])
    respond_to do |format|
      format.js
    end
  end
end
