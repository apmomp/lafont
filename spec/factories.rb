Factory.define :food_cat do |fc|
  fc.name "Example food cat"
  fc.section_id 1
end

Factory.define :food do |food| 
  food.name "Example food"
  food.desc "Food desc"
  food.price 3.2
end
