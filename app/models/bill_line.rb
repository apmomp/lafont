class BillLine < ActiveRecord::Base
  attr_accessible :name_id, :price

  belongs_to :bill

  belongs_to :name

  validates :bill_id, :presence => true

  validates :name_id, :presence => true

  validates :price, :presence => true,
                    :format => { :with => /^\d+??(?:\.\d{0,2})?$/ },
                    :numericality => {:greater_than => 0, :less_than => 200}
end
