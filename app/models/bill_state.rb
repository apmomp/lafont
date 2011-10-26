class BillState < ActiveRecord::Base

  has_many :bills, :foreign_key => :state_id

  validates :name, :presence => true,
                   :length => { :within => 2..15 },
                   :uniqueness => {:case_sensitive => false }
 
end
