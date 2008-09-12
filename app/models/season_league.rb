class SeasonLeague < ActiveRecord::Base
  belongs_to :league
  belongs_to :season
  
  has_many :groups
  
  def self.find_by_season_and_league_code(season, lc)
    self.find_by_league_code(lc,
                  :conditions => ["season_id = ?", season])
  end
end
