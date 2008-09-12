class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.integer :club_id
      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
