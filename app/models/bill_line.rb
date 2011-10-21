class BillLine < ActiveRecord::Base
  attr_accessible :food_id, :bill_id

  belongs_to :bill
  belongs_to :food

  validates :food_id, :presence => true

  validates :bill_id, :presence => true
end
