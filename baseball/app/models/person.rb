class Person < ActiveRecord::Base

  set_table_name (:Master)
  set_primary_key (:lahmanid)

  has_many :playerships, :foreign_key => "playerID", :primary_key => "playerID"
  has_many :teams, :through => :playerships
  has_many :batting_lines, :foreign_key => "playerID", :primary_key => "playerID"
  has_many :pitching_lines, :foreign_key => "playerID", :primary_key => "playerID"
  has_many :salaries, :foreign_key => "playerID", :primary_key => "playerID"
  has_many :management_lines, :foreign_key => "managerID", :primary_key => "managerID"
  has_many :managed_teams, :through => :management_lines, :source => :team

  def self.niceBattingAverage(avg)
    self
      .select("Master.playerID")
      .joins(:batting_lines)
      .where("(batting.H / batting.AB) > #{avg} AND batting.AB > 100")
      .group("playerID")
  end
#Person.select("Master.playerID").joins(:batting_lines).where("(batting.H / batting.AB) > 0.400 AND batting.AB > 100").group("playerID")
#select (H / AB), playerID from Batting where AB > 100 AND (H / AB) > 0.400 GROUP BY playerID;

  def self.most_experienced
    self
    .select("Master.nameFirst, Master.nameLast, Master.playerID, COUNT(DISTINCT yearID) as exp")
    .joins(:playerships)
    .group("playerID")
    .order("exp DESC")
    .limit(1)
  end

# select playerid, COUNT(DISTINCT yearID) as exp FROM Appearances GROUP BY playerID ORDER BY exp DESC LIMIT 1;
end