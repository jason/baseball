class PitchingLine < ActiveRecord::Base

  set_table_name (:pitching)

  belongs_to :person, :foreign_key => "playerID", :primary_key => "playerID"

end