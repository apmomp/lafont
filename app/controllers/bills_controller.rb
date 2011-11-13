# encoding: utf-8

class BillsController < ApplicationController
  before_filter :opened_cash
  before_filter :bill_state, :only => [:pay, :edit, :destroy]

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
    @bills = Bill.where("state_id = 1")
  end

  def edit
    @bill = Bill.find_by_id(params[:id])
    @title = "Editando #{@bill.name}"
    sec = (params[:section].nil?) ? 1 : params[:section]
    @foodcats = FoodCat.where("section_id = ?", sec)
    @bar = FoodCat.where("section_id in(2,3)")
  end

  def destroy
    Bill.find_by_id(params[:id]).destroy
    redirect_to bills_path
  end

  def pay
    bill = Bill.find_by_id(params[:bill_id])
    if params[:state] == "1"
      bill.state_id = 1
    elsif params[:state] == "2"
      bill.state_id = 2
      bill.cash_id = Cash.current.id
    elsif params[:state] == "3"
      bill.state_id = 3
      bill.cash_id = Cash.current.id
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
  
    def opened_cash 
      if Cash.current.nil?
        c = Cash.first
        if (not c.nil?) and c.created_at.strftime("%Y%m%d") == Time.zone.now.strftime("%Y%m%d")
          c.closed_at = nil
          flash[:success] = "Reabierta la caja con fecha de #{l c.created_at}"
          c.save!
        else
          c = Cash.create!
          flash[:success] = "Caja abierta a fecha de #{l c.created_at}"
        end
      end
    end

    def bill_state
      bill_id = (params[:bill_id]) ? params[:bill_id] : params[:id]
      if Bill.find_by_id(bill_id).state_id != 1
        flash[:notice] = "La cuenta está pagada y no puede ser modificada"
        redirect_back_or bills_path
      end
    end

end
