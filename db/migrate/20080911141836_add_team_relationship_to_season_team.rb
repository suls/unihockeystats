class AddTeamRelationshipToSeasonTeam < ActiveRecord::Migration
  def self.up
    add_column :season_teams, :team_id, :integer
  end

  def self.down
    remove_column :season_teams, :team_id
  end
end
