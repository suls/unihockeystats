class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :number
      t.integer :season_league_id

      t.timestamps
    end
    
    create_table :groups_season_teams do |t|
      t.integer :group_id
      t.integer :season_team_id
    end
  end

  def self.down
    drop_table :groups_season_teams
    drop_table :groups
  end
end
