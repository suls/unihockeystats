class Team < ActiveRecord::Base
  has_many :season_teams
  
  belongs_to :club
end
