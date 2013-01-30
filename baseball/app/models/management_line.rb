class ManagementLine < ActiveRecord::Base

  set_table_name (:managers)

  belongs_to :person, :foreign_key => "managerID", :primary_key => "managerID"
  belongs_to :team, :foreign_key => [:teamID, :yearID, :lgID], :primary_key => [:teamID, :yearID, :lgID]
end


# 17157
