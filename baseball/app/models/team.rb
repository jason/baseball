class Team < ActiveRecord::Base

  set_table_name (:teams)
  set_primary_keys(:teamID, :yearID, :lgID)
  has_many :playerships, :foreign_key => [:teamID, :yearID, :lgID]
  has_many :person, :through => :playerships
  has_many :management_lines
end