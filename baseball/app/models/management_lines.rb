class ManagementLines < ActiveRecord::Base

  set_table_name (:manage)

  belongs_to :person, :foreign_key => "playerID", :primary_key => "playerID"

end