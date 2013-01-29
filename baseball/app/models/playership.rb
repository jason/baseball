class Playership < ActiveRecord::Base

  set_table_name (:appearances)
  set_primary_keys(:teamID, :yearID, :lgID)

  belongs_to :person, :foreign_key => "playerID", :primary_key => "playerID"
  belongs_to :team, :foreign_key => [:teamID, :yearID, :lgID]
end