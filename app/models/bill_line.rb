class BillLine < ActiveRecord::Base
  attr_accessible :food_id, :bill_id

  belongs_to :bill

  validates :food_id, :presence => true

  validates :bill_id, :presence => true
end
