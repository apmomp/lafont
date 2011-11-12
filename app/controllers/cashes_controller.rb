# encoding: utf-8

class CashesController < ApplicationController
 
  def index
    @title = "Cajas"
    @cash = Cash.current
    @cashes = Cash.all
    @cashes.delete(@cash)

    @cashes_by_month = @cashes.group_by { |h_cash| h_cash.created_at.strftime("%Y %B") }
  end
  
  def show
    @cash = Cash.find_by_id(params[:id])
    @title = "Caja: #{@cash.created_at}"
  end
  
  def close
    cash = Cash.find_by_id(params[:cash_id])
    if not cash.nil?
      cash.closed_at = Time.now
      cash.total = cash.lines.sum(:price)
      if cash.save
        flash[:success] = "Caja cerrada con éxito"
      else
        flash[:notice] = "Error cerrando la caja"
      end
    else
      flash[:notice] = "No se pudo cerrar la caja"
    end
    redirect_to cashes_path
  end
  
end
