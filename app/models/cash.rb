class Cash < ActiveRecord::Base
  has_many :bills, :dependent => :destroy
  has_many :lines, :class_name => "BillLine", :foreign_key => :bill_id, :through => :bills
  
  default_scope :order => 'cashes.created_at DESC'
  
  def self.current
    cash = Cash.first
    if not cash.nil? and cash.created_at < Time.now and cash.closed_at == nil
      cash
    else
      nil
    end
  end

  def closed?
    self.closed_at != nil
  end
end
