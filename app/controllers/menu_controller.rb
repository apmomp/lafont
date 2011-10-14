class MenuController < ApplicationController
  def index
    @title = "Menu"
    if params[:section].nil?
      @foodcats = FoodCat.all
    else
      @foodcats = FoodCat.where("food_cat_section_id = ?", params[:section])
    end

  end
end
