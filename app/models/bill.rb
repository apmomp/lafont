class Bill < ActiveRecord::Base
  attr_accessible :name

  has_many :lines, :class_name => "BillLine", :foreign_key => :bill_id
  belongs_to :user
  has_many :foods, :through => :lines

  validates :name,   :presence => true,
                     :length => { :within => 2..32 },
                     :uniqueness => { :case_sensitive => true }

  validates :user_id, :presence => true

end
