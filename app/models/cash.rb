class Cash < ActiveRecord::Base
  has_many :bills, :dependent => :destroy
  has_many :bills_incash, :class_name => "Bill", :conditions => { :state_id => 2 }
  has_many :bills_cr, :class_name => "Bill", :conditions => { :state_id => 3 }
  
  has_many :lines, :class_name => "BillLine", :foreign_key => :bill_id, :through => :bills
  has_many :incash_lines, :class_name => "BillLine", :foreign_key => :bill_id, :through => :bills_incash, :source => :lines
  has_many :cr_lines, :class_name => "BillLine", :foreign_key => :bill_id, :through => :bills_cr, :source => :lines
  
 
  default_scope :order => 'cashes.created_at DESC'
  
  def self.current
    cash = Cash.first
    if not cash.nil? and cash.created_at < Time.zone.now and cash.closed_at == nil
      cash
    else
      nil
    end
  end

  def closed?
    self.closed_at != nil
  end
end
