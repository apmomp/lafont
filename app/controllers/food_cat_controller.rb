class FoodCatController < ApplicationController
  def show
    @cat = FoodCat.find_by_id(params[:id])
    @title = @cat.name
  end
end
