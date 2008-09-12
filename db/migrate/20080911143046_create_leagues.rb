class CreateLeagues < ActiveRecord::Migration
  def self.up
    create_table :leagues do |t|
      t.string :description
      t.integer :higher_league_id
      t.integer :lower_league_id
      t.timestamps
    end
  end

  def self.down
    drop_table :leagues
  end
end
