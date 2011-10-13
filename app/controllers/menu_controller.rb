class MenuController < ApplicationController
  def index
    @title = "Menu"
    @foodcats = FoodCat.all
    @iterator = 0
  end
end
