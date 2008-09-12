class CreateSeasonLeagues < ActiveRecord::Migration
  def self.up
    create_table :season_leagues do |t|
      t.integer :league_id
      t.integer :season_id

      t.timestamps
    end
  end

  def self.down
    drop_table :season_leagues
  end
end
