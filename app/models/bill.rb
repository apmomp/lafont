class Bill < ActiveRecord::Base
  attr_accessible :name

  has_many :bill_lines
  belongs_to :user

  validates :name,   :presence => true,
                     :length => { :within => 2..32 },
                     :uniqueness => { :case_sensitive => true }

end
