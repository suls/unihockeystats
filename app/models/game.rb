class Game < ActiveRecord::Base
  has_one :game_result

  # has_one :away_team, :class_name => "SeasonTeam"
  # has_one :home_team, :class_name => "SeasonTeam"
  
  belongs_to :home_season_team, 
             :class_name => "SeasonTeam",
             :foreign_key => "home_season_team_id"
             
  belongs_to :away_season_team,
             :class_name => "SeasonTeam", 
             :foreign_key => "away_season_team_id"
            
  belongs_to :round
end
