require 'spec_helper'

describe Food do
  before (:each) do
    @attr = {
      :name => "Example food",
      :desc => "",
      :price => 1.0 ,
      :cat_id => 0
    }
  end
  it "should create food" do
    Food.create!(@attr)
  end

  it "should require name" do
    food = Food.new(@attr.merge(:name => ""))
    food.should_not be_valid
  end

  it "should require price" do
    food = Food.new(@attr.merge(:price => ""))
    food.should_not be_valid
  end

  it "should reject duplicate names" do
    Food.create!(@attr)
    duplicated_food = Food.new(@attr)
    duplicated_food.should_not be_valid
  end

  it "should reject short or long names" do
    food = Food.new(@attr.merge(:name => "a"))
    food.should_not be_valid
    food.name = "a" * 33
    food.should_not be_valid
  end

  it "should reject long desc" do
    food = Food.new(@attr.merge(:desc => "a" * 256))
    food.should_not be_valid
  end

  it "should reject too low or high prices" do
    food = Food.new(@attr.merge(:price => 0 ))
    food.should_not be_valid
    food.price = 200
    food.should_not be_valid
  end

  describe "relationships" do
    before (:each) do
      @food = Food.create!(@attr)
    end
    it "should respond to cat" do
      @food.should respond_to :cat
    end
  end
  
end
