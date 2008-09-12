class CreateGameResults < ActiveRecord::Migration
  def self.up
    create_table :game_results do |t|
      t.integer :game_id
      t.integer :home_score
      t.integer :away_score
      t.boolean :forfait

      t.timestamps
    end
  end

  def self.down
    drop_table :game_results
  end
end
