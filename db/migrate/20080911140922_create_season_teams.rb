class CreateSeasonTeams < ActiveRecord::Migration
  def self.up
    create_table :season_teams do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :season_teams
  end
end
