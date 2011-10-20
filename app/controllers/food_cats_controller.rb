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
end
