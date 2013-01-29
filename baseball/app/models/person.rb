class Person < ActiveRecord::Base

  set_table_name (:Master)
  set_primary_key (:lahmanid)

  has_many :playerships, :foreign_key => "playerID", :primary_key => "playerID"
  has_many :teams, :through => :playerships
  has_many :batting_lines, :foreign_key => "playerID", :primary_key => "playerID"
  has_many :pitching_lines, :foreign_key => "playerID", :primary_key => "playerID"
  has_many :salaries, :foreign_key => "playerID", :primary_key => "playerID"

end