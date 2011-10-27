class Cash < ActiveRecord::Base
  has_many :bills
  has_many :lines, :class_name => "BillLine", :foreign_key => :bill_id, :through => :bills
  has_many :foods, :through => :lines
  
  default_scope :order => 'cashes.created_at DESC'
  
  def self.current
    cash = Cash.last
    if not cash.nil? and cash.created_at < Time.now and cash.closed_at == nil
      cash
    else
      nil
    end
  end
end