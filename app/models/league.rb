class League < ActiveRecord::Base
  has_many :season_leagues
  
  has_one :higher_league, :class_name => "League", :foreign_key => "higher_league_id"
  has_one :lower_league, :class_name => "League", :foreign_key => "lower_league_id"
end
