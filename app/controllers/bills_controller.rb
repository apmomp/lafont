class BillsController < ApplicationController
  before_filter :bill_state, :only => [:pay, :edit]

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
    state = (params[:state].nil?) ? 1 : params[:state]
    @bills = Bill.where("state_id = ?", state)
  end

  def edit
    @bill = Bill.find_by_id(params[:id])
    @title = "Editando #{@bill.name}"
    sec = (params[:section].nil?) ? 1 : params[:section]
    @foodcats = FoodCat.where("section_id = ?", sec)
  end

  def pay
    bill = Bill.find_by_id(params[:bill_id])
    if params[:state] == "1"
      bill.state_id = 1
    elsif params[:state] == "2"
      bill.state_id = 2
    elsif params[:state] == "3"
      bill.state_id = 3
    end

    bill.save

    redirect_to bills_path
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

  private

    def bill_state
      bill_id = (params[:bill_id]) ? params[:bill_id] : params[:id]
      if Bill.find_by_id(bill_id).state_id != 1
        flash[:notice] = "La cuenta está pagada y no puede ser modificada"
        redirect_to bills_path
      end
    end

end
