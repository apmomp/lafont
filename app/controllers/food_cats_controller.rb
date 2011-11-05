# encoding: utf-8

class FoodCatsController < ApplicationController
  
  def new
    @title = "Nueva categoría"
    @cat = FoodCat.new
  end

  def create
    @cat = FoodCat.new(params[:food_cat])
    @cat.section_id = params[:post][:section_id]
    if @cat.save
      flash[:success] = "Categoría añadida"
      redirect_to edit_food_cat_path(@cat)
    else
      @title = "Nueva categoría"
      flash[:notice] = "Categoría no añadida"
      render 'food_cats/new'
    end
  end

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
