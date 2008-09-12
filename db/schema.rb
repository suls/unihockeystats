# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080912100656) do

  create_table "clubs", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_results", :force => true do |t|
    t.integer  "game_id"
    t.integer  "home_score"
    t.integer  "away_score"
    t.boolean  "forfait"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "round_id"
    t.integer  "away_season_team_id"
    t.integer  "home_season_team_id"
    t.date     "date"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.integer  "number"
    t.integer  "season_league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_season_teams", :force => true do |t|
    t.integer "group_id"
    t.integer "season_team_id"
  end

  create_table "leagues", :force => true do |t|
    t.string   "description"
    t.integer  "higher_league_id"
    t.integer  "lower_league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "group_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "season_leagues", :force => true do |t|
    t.integer  "league_id"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "season_teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  create_table "seasons", :force => true do |t|
    t.string   "description"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
