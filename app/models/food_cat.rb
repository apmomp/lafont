class FoodCat < ActiveRecord::Base
  attr_accessible :name, :section_id

  has_many :foods, :foreign_key => :cat_id
  belongs_to :section

  validates :name, :presence => true,
                   :length => { :within => 2..32 },
                   :uniqueness => { :case_sensitive => false }

  validates :section_id, :presence => true
                     
end
