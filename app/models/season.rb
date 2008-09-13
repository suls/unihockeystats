class Season < ActiveRecord::Base
  has_many :season_leagues
  
  validates_uniqueness_of :year
end
