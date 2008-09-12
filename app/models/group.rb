class Group < ActiveRecord::Base
  has_and_belongs_to_many :season_teams, 
            :join_table => "groups_season_teams",
            :foreign_key => "season_teams_id"
  
  has_many :rounds
  
  belongs_to :season_league
end
