class AddLeagueCodeToSeasonLeague < ActiveRecord::Migration
  def self.up
    add_column :season_leagues, :league_code, :integer
  end

  def self.down
    remove_column :season_leagues, :league_code
  end
end
