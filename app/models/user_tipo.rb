class UserTipo < ActiveRecord::Base
  has_many :users, :foreign_key => "tipo_id"
end
