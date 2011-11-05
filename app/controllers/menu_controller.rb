# encoding: utf-8

class MenuController < ApplicationController

  def index
    @title = "Menú"
    sec = (params[:section].nil?) ? 1 : params[:section]
    @foodcats = FoodCat.where("section_id = ?", sec)
    
  end
end
