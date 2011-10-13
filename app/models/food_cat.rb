class FoodCat < ActiveRecord::Base
  attr_accessible :name

  has_many :foods

  validates :name, :presence => true,
                   :length => { :within => 2..32 },
                   :uniqueness => { :case_sensitive => false }

end
