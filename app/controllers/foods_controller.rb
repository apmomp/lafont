class FoodsController < ApplicationController

  def create
    @food = Food.new(params[:food])
    @food.cat_id=params[:food_cat_id]
    if @food.save
      flash[:success] = "¡Comida añadida!"
      redirect_to edit_food_cat_path(@food.cat)
    else
      flash[:notice] = "¡Comida no válida!"
      @cat = FoodCat.find_by_id(params[:food_cat_id])
      @title = "Editando #{@cat.name}..."
      render 'food_cats/edit'
    end

  end

  def destroy
    food = Food.find_by_id(params[:id])
    cat = food.cat
    food.destroy
    flash[:success] = "¡#{food.name} borrado!"
    redirect_back_or edit_food_cat_path(cat)
  end
  
  def edit
    @food = Food.find_by_id(params[:id])
    @title = "Editando #{@food.name}..."
  end
  
end
