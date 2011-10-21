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
    if params[:section].nil?
      @foodcats = FoodCat.all
    else
      @foodcats = FoodCat.where("section_id = ?", params[:section])
    end
  end 
end
