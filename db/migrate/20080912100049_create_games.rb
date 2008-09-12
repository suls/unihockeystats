class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :round_id
      t.integer :away_season_team_id
      t.integer :home_season_team_id
      # t.integer :game_result_id
      t.date :date
      t.string :place

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
