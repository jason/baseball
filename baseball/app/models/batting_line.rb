class BattingLine < ActiveRecord::Base

  set_table_name (:batting)

  belongs_to :person, :foreign_key => "playerID", :primary_key => "playerID"

end