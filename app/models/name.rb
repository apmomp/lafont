class Name < ActiveRecord::Base

  validates :name,  :presence => true,
                    :uniqueness => { :case_sensitive => false}
    
  

  def to_s
    self.name
  end
end
