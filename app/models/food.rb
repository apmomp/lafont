class Food < ActiveRecord::Base 
  attr_accessible :name, :desc, :price, :cat_id

  belongs_to :cat, :class_name => "FoodCat"

  default_scope :order => :name

  validates :name,   :presence => true,
                     :length => { :within => 2..32 },
                     :uniqueness => { :case_sensitive => false}

  validates :desc,   :length => { :maximum => 255 }

  validates :price,  :presence => true,
                     :format => { :with => /^\d+??(?:\.\d{0,2})?$/ },
                     :numericality => {:greater_than => 0, :less_than => 200}

  validates :cat_id, :presence => true

end
