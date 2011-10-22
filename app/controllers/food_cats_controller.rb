class FoodCatsController < ApplicationController

  def show
    @cat = FoodCat.find_by_id(params[:id])
    @title = @cat.name
  end

  def edit
    @cat = FoodCat.find_by_id(params[:id])
    @title = "Editando " + @cat.name + "..."
    @food = Food.new
  end

  def expand
    @cat = FoodCat.find_by_id(params[:food_cat_id])

    respond_to do |format|
      format.js
    end
  end

  def contract
    @cat = FoodCat.find_by_id(params[:food_cat_id])

    respond_to do |format|
      format.js
    end
  end
end
