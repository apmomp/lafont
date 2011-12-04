require 'spec_helper'

describe FoodCat do
  before (:each) do
    @attr = {
      :name => "Example cat",
      :section_id => 1
    }
  end

  it "should create a food_cat" do
    FoodCat.create!(@attr)
  end

  it "should reject too short or too long names" do
    fc = FoodCat.new(@attr.merge(:name => ""))
    fc.should_not be_valid
    fc.name = "a"
    fc.should_not be_valid
    fc.name = "a" * 33
    fc.should_not be_valid
  end

  describe "Working with foods..." do
    before (:each) do
      @cat = Factory(:food_cat)
      @food_attr = {
        :name => "Example food",
        :price => 3.2
      }
    end

    it "should create and remove a food" do
      food = Food.new
      lambda do
        food = @cat.foods.create!(@food_attr)
      end.should change(@cat.foods, :count).by(1)

      lambda do
        food.destroy
      end.should change(@cat.foods, :count).by(-1)

    end

    it "should delete foods inside" do
      food = @cat.foods.create!(@food_attr)
      @cat.destroy
      food.destroyed? == true
    end

  end
end
