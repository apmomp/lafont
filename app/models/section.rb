class Section < ActiveRecord::Base
  has_many :food_cats, :dependent => :destroy

end
