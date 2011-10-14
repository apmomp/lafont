class FoodCat < ActiveRecord::Base
  attr_accessible :name, :food_cat_section_id

  has_many :foods
  belongs_to :food_cat_section

  validates :name, :presence => true,
                   :length => { :within => 2..32 },
                   :uniqueness => { :case_sensitive => false }

end
