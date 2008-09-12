class SeasonTeam < ActiveRecord::Base
  belongs_to :team
  
  has_and_belongs_to_many :groups, 
           :join_table => "groups_season_teams",
           :foreign_key => "group_id"
  
  has_many :games, 
           :class_name => "Game",
           :finder_sql => 'select g.* from games g where g.home_season_team_id = #{id} ' +
                          'or g.away_season_team_id = #{id} '
 
  has_many :away_games, 
           :class_name => "Game",
           :foreign_key => "away_season_team_id"
           
  has_many :home_games,
           :class_name => "Game",
           :foreign_key => "home_season_team_id"
end
