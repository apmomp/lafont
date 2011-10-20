class BillsController < ApplicationController
  def new
    @title = "Nueva mesa"
    @bill = current_user.bills.new
  end

  def create

  end

  def index
    @title = "Lista de cuentas"
  end  
end
