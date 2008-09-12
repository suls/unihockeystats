class Group < ActiveRecord::Base
  has_and_belongs_to_many :season_teams, 
            :join_table => "groups_season_teams",
            :foreign_key => "season_teams_id"
  
  has_many :rounds
  
  belongs_to :season_league
  
  def self.find_by_season_league_and_number(sl, num)
    Group.find_by_number(num,
                  :conditions => ["season_league_id = ?", sl])
  end
end
