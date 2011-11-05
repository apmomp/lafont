class Bill < ActiveRecord::Base
  attr_accessible :name

  has_many :lines, :class_name => "BillLine", :foreign_key => :bill_id, :dependent => :destroy
  belongs_to :user
  belongs_to :state, :class_name => "BillState"
  belongs_to :cash
  has_many :foods, :through => :lines

  validates :name,   :presence => true,
                     :length => { :within => 2..32 }

  validates :user_id, :presence => true

end
